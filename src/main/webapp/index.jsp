<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Babu Banarasi Das University | Best Private University in Lucknow</title>
    <meta name="description" content="Babu Banarasi Das University – Best Private University in Lucknow. Career-focused UG & PG programs, world-class campus, vibrant student life. Admissions Open 2026-27!">
    <meta name="keywords" content="best university Lucknow, private university Uttar Pradesh, B.Tech, BCA, MBA, MCA, BBA admission 2026, engineering college Lucknow">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" href="favicon.png">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<%
    // ===== Course Data =====
    class Course {
        String tag, title, desc, img, link;
        Course(String tag, String title, String desc, String img, String link) {
            this.tag = tag; this.title = title; this.desc = desc; this.img = img; this.link = link;
        }
    }
    List<Course> courses = new ArrayList<>();
    courses.add(new Course("B.Tech", "Computer Science & Engineering", "Full-stack development, data structures, cloud computing & cyber security.", "images/course-cse.jpg", "courses.jsp"));
    courses.add(new Course("B.Tech", "Artificial Intelligence & ML", "Deep learning, NLP, computer vision & intelligent systems design.", "images/course-ai.jpg", "courses.jsp"));
    courses.add(new Course("MBA", "Master of Business Administration", "Finance, marketing, operations & entrepreneurship with industry internships.", "images/course-mba.jpg", "courses.jsp"));
    courses.add(new Course("BCA", "Bachelor of Computer Applications", "Programming fundamentals, web tech, DBMS & software engineering.", "images/course-bca.jpg", "courses.jsp"));

    // ===== Placement Data =====
    class Placement {
        String name, branch, company, pkg, avatar;
        Placement(String name, String branch, String company, String pkg, String avatar) {
            this.name = name; this.branch = branch; this.company = company; this.pkg = pkg; this.avatar = avatar;
        }
    }
    List<Placement> placements = new ArrayList<>();
    placements.add(new Placement("Ananya Sharma", "B.Tech (CSE)", "Amazon", "₹ 32 LPA", "images/student1.jpg"));
    placements.add(new Placement("Rohit Verma", "B.Tech (CSE-AI)", "Microsoft", "₹ 41 LPA", "images/student2.jpg"));
    placements.add(new Placement("Priya Singh", "MCA", "Cisco", "₹ 22 LPA", "images/student3.jpg"));
    placements.add(new Placement("Karan Mehta", "BCA", "TCS", "₹ 7.5 LPA", "images/student4.jpg"));
%>

<!-- ===== HERO ===== -->
<section class="hero" id="home" style="background: linear-gradient(135deg, rgba(15,27,45,0.72), rgba(139,26,43,0.55)), url('images/bbd-campus-hero.jpg?v=2') center/cover no-repeat;">
    <div class="container">
        <div class="hero-content">
            <h1>Best Private University<br><span>in Uttar Pradesh (India)</span></h1>
            <p>Babu Banarasi Das University integrates groundbreaking research and inclusive education to shape professionals driving innovation, sustainability, and social impact.</p>
            <div class="hero-buttons">
                <a href="apply.jsp" class="btn">Apply Today →</a>
                <a href="courses.jsp" class="btn btn-outline">Explore Courses</a>
            </div>
        </div>
    </div>
</section>

<!-- ===== STATS ===== -->
<section class="stats-section reveal">
    <div class="container">
        <div class="stats-heading">
            <h2>Choose Excellence at <span>BBDU</span></h2>
            <div class="stats-subtitle">A Premier University in Lucknow</div>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <span class="stat-number" data-target="25">0</span><span class="stat-suffix">+ years</span>
                <div class="stat-label">Academic Excellence</div>
                <div class="stat-divider"></div>
                <div class="stat-desc">25+ Years of Academic Excellence — UGC Recognized | NAAC Accredited</div>
            </div>
            <div class="stat-card">
                <span class="stat-number" data-target="60">0</span><span class="stat-suffix">+</span>
                <div class="stat-label">Programs</div>
                <div class="stat-divider"></div>
                <div class="stat-desc">Industry-Oriented Academic Programs across Engineering, Management & Law</div>
            </div>
            <div class="stat-card">
                <span class="stat-number" data-target="500">0</span><span class="stat-suffix">+</span>
                <div class="stat-label">Industry Experts</div>
                <div class="stat-divider"></div>
                <div class="stat-desc">Delivering industry-driven mentorship & hands-on training</div>
            </div>
            <div class="stat-card">
                <span class="stat-number" data-target="25000">0</span><span class="stat-suffix">+</span>
                <div class="stat-label">Stadium Capacity</div>
                <div class="stat-divider"></div>
                <div class="stat-desc">State-of-the-art BCCI-approved cricket stadium on campus</div>
            </div>
            <div class="stat-card">
                <span class="stat-number" data-target="15000">0</span><span class="stat-suffix">+</span>
                <div class="stat-label">Alumni</div>
                <div class="stat-divider"></div>
                <div class="stat-desc">Alumni making an impact worldwide across top companies</div>
            </div>
        </div>
    </div>
</section>

<!-- ===== POPULAR PROGRAMS ===== -->
<section class="section reveal" id="courses">
    <div class="container">
        <div class="section-heading">
            <span class="tag">Academics</span>
            <h2>Popular Programs</h2>
            <p>Industry-aligned undergraduate and postgraduate programs designed for the careers of tomorrow.</p>
        </div>

        <div class="courses-grid">
            <% for (Course c : courses) { %>
            <div class="course-card">
                <div class="card-img-wrap">
                    <img src="<%= c.img %>" alt="<%= c.title %>" onerror="this.src='https://placehold.co/400x220/8B1A2B/ffffff?text=<%= c.tag %>'">
                </div>
                <div class="body">
                    <span><%= c.tag %></span>
                    <h3><%= c.title %></h3>
                    <p><%= c.desc %></p>
                    <a href="<%= c.link %>">Learn More →</a>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>

<!-- ===== PLACEMENTS ===== -->
<section class="section bg-light reveal" id="placements">
    <div class="container">
        <div class="section-heading">
            <span class="tag">Placements</span>
            <h2>Top Companies Hire Our Talent</h2>
            <p>Our placement cell partners with leading recruiters to build strong career pathways for every student.</p>
        </div>

        <div class="placement-grid">
            <% for (Placement p : placements) { %>
            <div class="placement-card">
                <img class="avatar" src="<%= p.avatar %>" alt="<%= p.name %>" onerror="this.src='https://placehold.co/100x100/8B1A2B/ffffff?text=<%= p.name.substring(0,1) %>'">
                <h4><%= p.name %></h4>
                <div class="company"><%= p.branch %></div>
                <div class="package"><%= p.pkg %></div>
                <div class="company">Placed at <%= p.company %></div>
            </div>
            <% } %>
        </div>
    </div>
</section>

<!-- ===== CAMPUS LIFE (Bento Grid) ===== -->
<section class="section reveal">
    <div class="container">
        <div class="section-heading">
            <span class="tag">Student Life</span>
            <h2>A Campus <em style="font-family:var(--font-serif); font-weight:400;">Experience</em> Like No Other</h2>
            <p>Spaces, opportunities, and experiences that shape your journey beyond the classroom.</p>
        </div>

        <!-- Tabs -->
        <div class="campus-tabs">
            <button class="campus-tab active" data-tab="culture">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22a1 1 0 0 1 0-20 10 9 0 0 1 10 9 5 5 0 0 1-5 5h-2.25a1.75 1.75 0 0 0-1.4 2.8l.3.4a1.75 1.75 0 0 1-1.4 2.8z"/><circle cx="13.5" cy="6.5" r=".5" fill="currentColor"/><circle cx="17.5" cy="10.5" r=".5" fill="currentColor"/><circle cx="6.5" cy="12.5" r=".5" fill="currentColor"/><circle cx="8.5" cy="7.5" r=".5" fill="currentColor"/></svg>
                Art & Culture
            </button>
            <button class="campus-tab" data-tab="sports">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M12 2a15 15 0 0 1 0 20M12 2a15 15 0 0 0 0 20M2 12h20"/></svg>
                Sports & Fitness
            </button>
            <button class="campus-tab" data-tab="hostel">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z"/><path d="M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2"/><path d="M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2"/><path d="M10 6h4"/><path d="M10 10h4"/><path d="M10 14h4"/><path d="M10 18h4"/></svg>
                Residential Facilities
            </button>
            <button class="campus-tab" data-tab="clubs">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                Student Organizations
            </button>
        </div>

        <!-- Panel: Art & Culture -->
        <div class="campus-bento campus-panel" data-panel="culture" style="transition: opacity 0.3s ease;">
            <div class="bento-card bento-info" style="grid-row: span 2;">
                <div>
                    <div class="bento-icon">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 2L13.5 7.5L19 9L13.5 10.5L12 16L10.5 10.5L5 9L10.5 7.5L12 2Z" fill="#D4A841"/><path d="M5 19L6 16.5L8.5 15.5L6 14.5L5 12L4 14.5L1.5 15.5L4 16.5L5 19Z" fill="#D4A841"/></svg>
                    </div>
                    <h3>Art & Culture</h3>
                    <div class="bento-divider"></div>
                    <p>The Art & Culture club brings together creative minds to showcase their artistic talents — theatre, dance, music & fine arts.</p>
                </div>
                <a href="#" class="bento-btn">Read more →</a>
            </div>
            <div class="bento-card" style="grid-column: 2;">
                <img src="images/campus-culture.png" alt="Cultural Event">
                <div class="bento-overlay"><h3>Annual Cultural Fest</h3><p>1400+ participants each year</p></div>
            </div>
            <div class="bento-card bento-stat" style="grid-column: 2;">
                <h2>1400+</h2>
                <p>Participants Every Year</p>
            </div>
            <div class="bento-card" style="grid-column: 3; grid-row: span 2;">
                <img src="images/campus-library.png" alt="Campus Library">
                <div class="bento-overlay"><h3>Central Library</h3><p>50,000+ volumes & digital archive</p></div>
            </div>
        </div>

        <!-- Panel: Sports -->
        <div class="campus-bento campus-panel" data-panel="sports" style="display:none; transition: opacity 0.3s ease;">
            <div class="bento-card bento-info" style="grid-row: span 2;">
                <div>
                    <div class="bento-icon">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="12" cy="12" r="10" stroke="#D4A841" stroke-width="2"/><path d="M12 2a15 15 0 0 1 0 20M12 2a15 15 0 0 0 0 20M2 12h20" stroke="#D4A841" stroke-width="2"/></svg>
                    </div>
                    <h3>Sports & Fitness</h3>
                    <div class="bento-divider"></div>
                    <p>World-class sports infrastructure including a BCCI-approved cricket stadium, Olympic pool, gym, and tennis courts.</p>
                </div>
                <a href="#" class="bento-btn">Read more →</a>
            </div>
            <div class="bento-card" style="grid-column: 2; grid-row: span 2;">
                <img src="images/campus-sports.png" alt="Sports Arena">
                <div class="bento-overlay"><h3>Sports Complex</h3><p>25,000-seat cricket stadium</p></div>
            </div>
            <div class="bento-card bento-stat" style="grid-column: 3;">
                <h2>25K</h2>
                <p>Stadium Capacity</p>
            </div>
            <div class="bento-card" style="grid-column: 3;">
                <img src="images/campus-culture.png" alt="Fitness Centre">
                <div class="bento-overlay"><h3>Khelo India</h3><p>National-level sports hosting</p></div>
            </div>
        </div>

        <!-- Panel: Hostel -->
        <div class="campus-bento campus-panel" data-panel="hostel" style="display:none; transition: opacity 0.3s ease;">
            <div class="bento-card bento-info" style="grid-row: span 2;">
                <div>
                    <div class="bento-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#D4A841" stroke-width="2"><path d="M6 22V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v18Z"/><path d="M6 12H4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h2"/><path d="M18 9h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-2"/></svg>
                    </div>
                    <h3>Residential Facilities</h3>
                    <div class="bento-divider"></div>
                    <p>Separate boys & girls hostels with Wi-Fi, mess, laundry, 24/7 security, and recreational rooms.</p>
                </div>
                <a href="#" class="bento-btn">Read more →</a>
            </div>
            <div class="bento-card" style="grid-column: 2; grid-row: span 2;">
                <img src="images/campus-hostel.png" alt="Hostel Building">
                <div class="bento-overlay"><h3>Modern Hostels</h3><p>Safe, comfortable living spaces</p></div>
            </div>
            <div class="bento-card bento-stat" style="grid-column: 3;">
                <h2>2000+</h2>
                <p>Hostel Capacity</p>
            </div>
            <div class="bento-card" style="grid-column: 3;">
                <img src="images/campus-library.png" alt="Study Space">
                <div class="bento-overlay"><h3>Study Lounges</h3><p>24/7 access for residents</p></div>
            </div>
        </div>

        <!-- Panel: Clubs -->
        <div class="campus-bento campus-panel" data-panel="clubs" style="display:none; transition: opacity 0.3s ease;">
            <div class="bento-card bento-info" style="grid-row: span 2;">
                <div>
                    <div class="bento-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#D4A841" stroke-width="2"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                    </div>
                    <h3>Student Organizations</h3>
                    <div class="bento-divider"></div>
                    <p>20+ active clubs — Coding, Robotics, Debate, Photography, E-Sports, Social Service & more.</p>
                </div>
                <a href="#" class="bento-btn">Read more →</a>
            </div>
            <div class="bento-card" style="grid-column: 2;">
                <img src="images/campus-sports.png" alt="Student Event">
                <div class="bento-overlay"><h3>Tech Fest</h3><p>Annual innovation showcase</p></div>
            </div>
            <div class="bento-card bento-stat" style="grid-column: 2;">
                <h2>20+</h2>
                <p>Active Student Clubs</p>
            </div>
            <div class="bento-card" style="grid-column: 3; grid-row: span 2;">
                <img src="images/campus-culture.png" alt="Alumni Meet">
                <div class="bento-overlay"><h3>Alumni Network</h3><p>15,000+ strong worldwide</p></div>
            </div>
        </div>
    </div>
</section>

<!-- ===== WHY CHOOSE US ===== -->
<section class="section bg-light reveal">
    <div class="container">
        <div class="section-heading">
            <span class="tag">Why Us</span>
            <h2>Why Choose BBDU?</h2>
            <p>A university that invests in your future with research, industry connections, and global opportunities.</p>
        </div>

        <div class="feature-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
                </div>
                <h3>Research-Driven Learning</h3>
                <p>Dedicated research centres, funded projects, and mentorship under PhD faculty ensure you contribute to real-world breakthroughs.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect width="18" height="18" x="3" y="3" rx="2"/><path d="M3 9h18"/><path d="M9 21V9"/></svg>
                </div>
                <h3>Industry Connections</h3>
                <p>1200+ recruiting companies, mandatory internships, and curriculum co-designed with industry leaders like TCS, Infosys & Amazon.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M2 12h20"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>
                </div>
                <h3>Global Alumni Network</h3>
                <p>15,000+ alumni making an impact worldwide — from Silicon Valley to Wall Street, and leading startups across India.</p>
            </div>
        </div>
    </div>
</section>

<!-- ===== CTA ===== -->
<section class="cta reveal">
    <div class="container">
        <h2>Admissions Open for 2026-27</h2>
        <p>Limited seats available across UG & PG programs. Apply today to secure your spot at Lucknow's premier university.</p>
        <a href="apply.jsp" class="btn">Apply Now →</a>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />

</body>
</html>
