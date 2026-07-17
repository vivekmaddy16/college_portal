<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Babu Banarasi Das University</title>
    <meta name="description" content="Learn about Babu Banarasi Das University — 25+ years of academic excellence, UGC recognized, NAAC accredited. Our mission, vision, and campus infrastructure.">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<!-- ===== HERO SUB ===== -->
<section class="hero hero-sub">
    <div class="container">
        <div class="hero-content">
            <h1>About <span>BBDU</span></h1>
            <p>25+ years of academic excellence, UGC recognized, NAAC accredited — shaping future-ready professionals.</p>
        </div>
    </div>
</section>

<!-- ===== WHO WE ARE ===== -->
<section class="section reveal">
    <div class="container">
        <div class="section-heading">
            <span class="tag">Who We Are</span>
            <h2>Building Future-Ready Professionals</h2>
            <p>
                Babu Banarasi Das University integrates research-driven learning with industry mentorship
                to shape professionals ready to lead in technology, business, healthcare, law, and design.
                Our campus spans over 100 acres with modern labs, hostels, sports infrastructure, and a
                vibrant student community drawn from across India.
            </p>
        </div>

        <div class="feature-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="m16 10-4 4-4-4"/></svg>
                </div>
                <h3>Our Mission</h3>
                <p>Curriculum co-designed with industry partners so every graduate is job-ready from day one. We bridge the gap between academia and industry.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"/><circle cx="12" cy="12" r="3"/></svg>
                </div>
                <h3>Our Vision</h3>
                <p>Preparing socially responsible leaders who drive innovation and sustainability worldwide — creating impact beyond borders.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10z"/><path d="m9 12 2 2 4-4"/></svg>
                </div>
                <h3>Our Values</h3>
                <p>A culture built on academic rigor, ethical conduct, and inclusive growth for every student — regardless of background.</p>
            </div>
        </div>
    </div>
</section>

<!-- ===== CAMPUS IN NUMBERS ===== -->
<section class="section bg-light reveal">
    <div class="container">
        <div class="section-heading">
            <span class="tag">Campus</span>
            <h2>Our Campus in Numbers</h2>
            <p>A sprawling green campus with world-class infrastructure for learning, living, and growing.</p>
        </div>

        <div class="campus-stats-grid">
            <div class="campus-stat-card">
                <div class="stat-icon">🏫</div>
                <h3>100+</h3>
                <p>Acres of Green Campus</p>
            </div>
            <div class="campus-stat-card">
                <div class="stat-icon">🔬</div>
                <h3>50+</h3>
                <p>State-of-the-Art Labs</p>
            </div>
            <div class="campus-stat-card">
                <div class="stat-icon">📚</div>
                <h3>50,000+</h3>
                <p>Library Volumes</p>
            </div>
            <div class="campus-stat-card">
                <div class="stat-icon">🏠</div>
                <h3>2,000+</h3>
                <p>Hostel Capacity</p>
            </div>
        </div>
    </div>
</section>

<!-- ===== ACCREDITATIONS ===== -->
<section class="section reveal">
    <div class="container">
        <div class="section-heading">
            <span class="tag">Recognition</span>
            <h2>Accreditations & Approvals</h2>
            <p>Recognized by India's premier academic and regulatory bodies.</p>
        </div>

        <div class="accreditation-grid">
            <div class="accreditation-badge">
                <div class="badge-icon">UGC</div>
                <h4>UGC Recognized</h4>
                <p>University Grants Commission of India</p>
            </div>
            <div class="accreditation-badge">
                <div class="badge-icon">A+</div>
                <h4>NAAC Accredited</h4>
                <p>National Assessment & Accreditation Council</p>
            </div>
            <div class="accreditation-badge">
                <div class="badge-icon">AICTE</div>
                <h4>AICTE Approved</h4>
                <p>All India Council for Technical Education</p>
            </div>
            <div class="accreditation-badge">
                <div class="badge-icon">BCI</div>
                <h4>BCI Recognized</h4>
                <p>Bar Council of India (Law Programs)</p>
            </div>
        </div>
    </div>
</section>

<!-- ===== CTA ===== -->
<section class="cta reveal">
    <div class="container">
        <h2>Start Your Journey With Us</h2>
        <p>Join 15,000+ alumni shaping the future. Admissions open for 2026-27.</p>
        <a href="apply.jsp" class="btn">Apply Now →</a>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
