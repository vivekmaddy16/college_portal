<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply Now | Babu Banarasi Das University — Admissions 2026-27</title>
    <meta name="description" content="Apply online for admission at Babu Banarasi Das University. UG & PG programs in Engineering, Management, Law, and more. Limited seats — apply now!">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" href="favicon.png">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<!-- ===== HERO SUB ===== -->
<section class="hero hero-sub">
    <div class="container">
        <div class="hero-content">
            <h1>Admissions <span>2026-27</span></h1>
            <p>Phase-I Registration Open. Fill the form below and our admissions team will reach out within 24 hours.</p>
        </div>
    </div>
</section>

<!-- ===== APPLICATION FORM ===== -->
<section class="section">
    <div class="container" style="max-width:640px;">

        <div class="section-heading" style="margin-bottom:32px;">
            <span class="tag">Admissions</span>
            <h2>Online Application</h2>
            <p>Please fill in your details below. All fields marked * are mandatory.</p>
        </div>

        <%
            String status = request.getParameter("status");
            if ("success".equals(status)) {
        %>
            <div class="alert-success">✅ Application submitted successfully! Our team will contact you shortly.</div>
        <% } else if ("error".equals(status)) { %>
            <div class="alert-error">❌ Please fill in all required fields correctly.</div>
        <% } %>

        <form id="applyForm" action="contact-submit" method="post">
            <div class="form-group">
                <label for="name">Full Name *</label>
                <input type="text" id="name" name="name" placeholder="Enter your full name" required>
            </div>
            <div class="form-group">
                <label for="email">Email Address *</label>
                <input type="email" id="email" name="email" placeholder="you@example.com" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number *</label>
                <input type="tel" id="phone" name="phone" placeholder="+91 XXXXXXXXXX" required>
            </div>
            <div class="form-group">
                <label for="program">Select Program *</label>
                <select id="program" name="program" required>
                    <option value="">— Choose a program —</option>
                    <option>B.Tech - Computer Science & Engineering</option>
                    <option>B.Tech - Artificial Intelligence</option>
                    <option>B.Tech - Electronics & Communication</option>
                    <option>BCA</option>
                    <option>MCA</option>
                    <option>BBA</option>
                    <option>MBA</option>
                    <option>B.Com (Hons)</option>
                    <option>BA LLB (Integrated)</option>
                    <option>B.Pharm</option>
                </select>
            </div>
            <div class="form-group">
                <label for="message">Additional Notes (Optional)</label>
                <textarea id="message" name="message" placeholder="Any specific queries or information..." style="min-height:80px;"></textarea>
            </div>
            <button type="submit" class="btn btn-primary" style="width:100%;">Submit Application →</button>
        </form>

        <p style="text-align:center; margin-top:20px; font-size:13px; color:var(--gray-500);">
            By submitting, you agree to be contacted by our admissions team via phone and email.
        </p>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
