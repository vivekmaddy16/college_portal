/* ===================================================================
   Babu Banarasi Das University — Interactive Script
   =================================================================== */

document.addEventListener('DOMContentLoaded', function () {

  /* ===== 1. Mobile Navigation Toggle ===== */
  const toggle = document.querySelector('.menu-toggle');
  const navLinks = document.querySelector('.nav-links');
  const body = document.body;

  if (toggle && navLinks) {
    toggle.addEventListener('click', () => {
      const isOpen = navLinks.classList.toggle('open');
      body.classList.toggle('nav-open', isOpen);
      toggle.innerHTML = isOpen ? '&#10005;' : '&#9776;';
    });

    // Close on link click
    navLinks.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', () => {
        navLinks.classList.remove('open');
        body.classList.remove('nav-open');
        toggle.innerHTML = '&#9776;';
      });
    });
  }

  /* ===== 2. Sticky Header Scroll Effect ===== */
  const header = document.querySelector('.main-header');
  if (header) {
    let lastScroll = 0;
    window.addEventListener('scroll', () => {
      const currentScroll = window.pageYOffset;
      if (currentScroll > 50) {
        header.classList.add('scrolled');
      } else {
        header.classList.remove('scrolled');
      }
      lastScroll = currentScroll;
    }, { passive: true });
  }

  /* ===== 3. Animated Stat Counters ===== */
  const counters = document.querySelectorAll('.stat-number');
  const counterSpeed = 60;

  const animateCounter = (el) => {
    const target = +el.getAttribute('data-target');
    let count = 0;
    const increment = Math.max(1, Math.ceil(target / counterSpeed));

    const update = () => {
      count += increment;
      if (count >= target) {
        el.textContent = target.toLocaleString();
        // Pulse animation on complete
        el.closest('.stat-card')?.classList.add('counted');
      } else {
        el.textContent = count.toLocaleString();
        requestAnimationFrame(update);
      }
    };
    update();
  };

  const counterObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        animateCounter(entry.target);
        counterObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.3 });

  counters.forEach((c) => counterObserver.observe(c));

  /* ===== 4. Scroll-Reveal Animation ===== */
  const revealElements = document.querySelectorAll('.reveal');
  const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        revealObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.15, rootMargin: '0px 0px -50px 0px' });

  revealElements.forEach(el => revealObserver.observe(el));

  /* ===== 5. Campus Life Tab Switcher ===== */
  const campusTabs = document.querySelectorAll('.campus-tab');
  const campusPanels = document.querySelectorAll('.campus-panel');

  campusTabs.forEach(tab => {
    tab.addEventListener('click', () => {
      const target = tab.getAttribute('data-tab');

      // Switch active tab
      campusTabs.forEach(t => t.classList.remove('active'));
      tab.classList.add('active');

      // Switch panel with fade
      campusPanels.forEach(panel => {
        if (panel.getAttribute('data-panel') === target) {
          panel.style.display = 'grid';
          panel.style.opacity = '0';
          setTimeout(() => { panel.style.opacity = '1'; }, 20);
        } else {
          panel.style.opacity = '0';
          setTimeout(() => { panel.style.display = 'none'; }, 300);
        }
      });
    });
  });

  /* ===== 6. Back to Top Button ===== */
  const backToTop = document.querySelector('.back-to-top');
  if (backToTop) {
    window.addEventListener('scroll', () => {
      if (window.pageYOffset > 400) {
        backToTop.classList.add('show');
      } else {
        backToTop.classList.remove('show');
      }
    }, { passive: true });

    backToTop.addEventListener('click', () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  /* ===== 7. Smooth Scroll for Anchor Links ===== */
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      const targetId = this.getAttribute('href');
      if (targetId === '#') return;
      const targetEl = document.querySelector(targetId);
      if (targetEl) {
        e.preventDefault();
        const headerHeight = header ? header.offsetHeight : 0;
        const targetPosition = targetEl.getBoundingClientRect().top + window.pageYOffset - headerHeight - 20;
        window.scrollTo({ top: targetPosition, behavior: 'smooth' });
      }
    });
  });

  /* ===== 8. Contact Form Validation ===== */
  const contactForm = document.getElementById('contactForm');
  if (contactForm) {
    contactForm.addEventListener('submit', function (e) {
      const name = document.getElementById('name');
      const email = document.getElementById('email');
      const phone = document.getElementById('phone');
      let valid = true;

      [name, email, phone].forEach((field) => {
        if (field && !field.value.trim()) {
          field.classList.add('error');
          valid = false;
        } else if (field) {
          field.classList.remove('error');
        }
      });

      // Email pattern check
      if (email && email.value && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value)) {
        email.classList.add('error');
        valid = false;
      }

      // Phone pattern check (basic)
      if (phone && phone.value && !/^[\d\s\-+()]{7,15}$/.test(phone.value)) {
        phone.classList.add('error');
        valid = false;
      }

      if (!valid) e.preventDefault();
    });

    // Remove error on input
    contactForm.querySelectorAll('input, select, textarea').forEach(field => {
      field.addEventListener('input', () => {
        field.classList.remove('error');
      });
    });
  }

  /* ===== 9. Apply Form Validation ===== */
  const applyForm = document.getElementById('applyForm');
  if (applyForm) {
    applyForm.addEventListener('submit', function (e) {
      const fields = applyForm.querySelectorAll('[required]');
      let valid = true;

      fields.forEach(field => {
        if (!field.value.trim()) {
          field.classList.add('error');
          valid = false;
        } else {
          field.classList.remove('error');
        }
      });

      if (!valid) e.preventDefault();
    });

    applyForm.querySelectorAll('input, select').forEach(field => {
      field.addEventListener('input', () => {
        field.classList.remove('error');
      });
    });
  }

  /* ===== 10. Course Filter (courses page) ===== */
  const filterBtns = document.querySelectorAll('.filter-btn');
  const courseCards = document.querySelectorAll('.course-card[data-category]');

  filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      const filter = btn.getAttribute('data-filter');

      filterBtns.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      courseCards.forEach(card => {
        if (filter === 'all' || card.getAttribute('data-category') === filter) {
          card.style.display = '';
          card.style.opacity = '0';
          card.style.transform = 'translateY(10px)';
          setTimeout(() => {
            card.style.opacity = '1';
            card.style.transform = 'translateY(0)';
          }, 50);
        } else {
          card.style.opacity = '0';
          card.style.transform = 'translateY(10px)';
          setTimeout(() => { card.style.display = 'none'; }, 300);
        }
      });
    });
  });

  /* ===== 11. Parallax subtle effect on hero ===== */
  const hero = document.querySelector('.hero');
  if (hero) {
    window.addEventListener('scroll', () => {
      const scroll = window.pageYOffset;
      if (scroll < window.innerHeight) {
        hero.style.backgroundPositionY = (scroll * 0.3) + 'px';
      }
    }, { passive: true });
  }

});
