<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses | Babu Banarasi Das University</title>
    <meta name="description" content="Explore 60+ industry-oriented programs at Babu Banarasi Das University — B.Tech, BCA, MCA, MBA, BBA, B.Com, BA LLB and more.">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<%
    class Program {
        String name, duration, category, desc;
        Program(String name, String duration, String category, String desc) {
            this.name = name; this.duration = duration; this.category = category; this.desc = desc;
        }
    }
    List<Program> programs = new ArrayList<>();
    programs.add(new Program("B.Tech - Computer Science & Engineering", "4 Years", "engineering", "Full-stack development, algorithms, cloud computing, and cyber security."));
    programs.add(new Program("B.Tech - Artificial Intelligence", "4 Years", "engineering", "Deep learning, NLP, computer vision, and intelligent systems design."));
    programs.add(new Program("B.Tech - Electronics & Communication", "4 Years", "engineering", "VLSI design, embedded systems, signal processing & IoT applications."));
    programs.add(new Program("BCA", "3 Years", "computing", "Programming fundamentals, web technologies, DBMS & software engineering."));
    programs.add(new Program("MCA", "2 Years", "computing", "Advanced software development, data science, and enterprise application design."));
    programs.add(new Program("BBA", "3 Years", "management", "Business fundamentals, marketing, HR, and entrepreneurship essentials."));
    programs.add(new Program("MBA", "2 Years", "management", "Finance, marketing, operations & entrepreneurship with industry internships."));
    programs.add(new Program("B.Com (Hons)", "3 Years", "commerce", "Accounting, taxation, finance, and business law — CA foundation-ready."));
    programs.add(new Program("BA LLB (Integrated)", "5 Years", "law", "Constitutional law, corporate law, litigation & moot court training."));
    programs.add(new Program("B.Pharm", "4 Years", "health", "Pharmaceutical sciences, drug formulation, pharmacology & clinical research."));
%>

<!-- ===== HERO SUB ===== -->
<section class="hero hero-sub">
    <div class="container">
        <div class="hero-content">
            <h1>Explore Our <span>Programs</span></h1>
            <p>60+ industry-oriented UG & PG programs across Engineering, Management, Law, Health Sciences, and more.</p>
        </div>
    </div>
</section>

<!-- ===== COURSES ===== -->
<section class="section">
    <div class="container">
        <div class="section-heading">
            <span class="tag">Academics</span>
            <h2>All Programs</h2>
        </div>

        <!-- Filter Bar -->
        <div class="course-filter-bar">
            <button class="filter-btn active" data-filter="all">All Programs</button>
            <button class="filter-btn" data-filter="engineering">Engineering</button>
            <button class="filter-btn" data-filter="computing">Computing</button>
            <button class="filter-btn" data-filter="management">Management</button>
            <button class="filter-btn" data-filter="commerce">Commerce</button>
            <button class="filter-btn" data-filter="law">Law</button>
            <button class="filter-btn" data-filter="health">Health Sciences</button>
        </div>

        <!-- Course Grid -->
        <div class="courses-grid">
            <% for (Program prog : programs) { %>
            <div class="course-card" data-category="<%= prog.category %>" style="transition: opacity 0.3s ease, transform 0.3s ease;">
                <div class="body">
                    <span><%= prog.duration %></span>
                    <h3><%= prog.name %></h3>
                    <p><%= prog.desc %></p>
                    <a href="apply.jsp">Apply Now →</a>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>

<!-- ===== CTA ===== -->
<section class="cta reveal">
    <div class="container">
        <h2>Can't Decide? We're Here to Help</h2>
        <p>Talk to our admissions counselors and find the perfect program for your career goals.</p>
        <a href="contact.jsp" class="btn">Get Guidance →</a>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
