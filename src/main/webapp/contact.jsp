<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Babu Banarasi Das University</title>
    <meta name="description" content="Get in touch with Babu Banarasi Das University. Contact our admissions team, visit our campus, or send us a message.">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" href="favicon.png">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<!-- ===== HERO SUB ===== -->
<section class="hero hero-sub">
    <div class="container">
        <div class="hero-content">
            <h1>Get in <span>Touch</span></h1>
            <p>Have questions about admissions or programs? We're here to help you every step of the way.</p>
        </div>
    </div>
</section>

<!-- ===== CONTACT SECTION ===== -->
<section class="section">
    <div class="container contact-wrap">

        <!-- Left: Form -->
        <div>
            <div class="section-heading" style="text-align:left; margin:0 0 28px;">
                <span class="tag" style="display:inline-block;">Contact Form</span>
                <h2 style="font-size:28px;">Send Us a Message</h2>
            </div>

            <%
                String status = request.getParameter("status");
                if ("success".equals(status)) {
            %>
                <div class="alert-success">✅ Thank you! Your message has been received. Our admissions team will contact you soon.</div>
            <% } else if ("error".equals(status)) { %>
                <div class="alert-error">❌ Please fill in all required fields correctly.</div>
            <% } %>

            <form id="contactForm" action="contact-submit" method="post">
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
                    <label for="program">Program Interested In</label>
                    <select id="program" name="program">
                        <option value="">— Select a program —</option>
                        <option>B.Tech - Computer Science & Engineering</option>
                        <option>B.Tech - Artificial Intelligence</option>
                        <option>BCA</option>
                        <option>MCA</option>
                        <option>BBA</option>
                        <option>MBA</option>
                        <option>B.Com (Hons)</option>
                        <option>BA LLB (Integrated)</option>
                        <option>Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="message" placeholder="Tell us how we can help..."></textarea>
                </div>
                <button type="submit" class="btn btn-primary" style="width:100%;">Submit Enquiry →</button>
            </form>
        </div>

        <!-- Right: Info + Map -->
        <div>
            <div class="section-heading" style="text-align:left; margin:0 0 28px;">
                <span class="tag" style="display:inline-block;">Reach Us</span>
                <h2 style="font-size:28px;">Campus Address</h2>
            </div>

            <div class="contact-info-card">
                <div class="contact-info-item">
                    <div class="info-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/><circle cx="12" cy="10" r="3"/></svg>
                    </div>
                    <div>
                        <h4>Address</h4>
                        <p>Babu Banarasi Das University, City Campus,<br>Ayodhya Road, Lucknow, UP — 226028</p>
                    </div>
                </div>
                <div class="contact-info-item">
                    <div class="info-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
                    </div>
                    <div>
                        <h4>Phone</h4>
                        <p>+91-522-6196300 (Admissions)<br>+91-522-6196222 (General)</p>
                    </div>
                </div>
                <div class="contact-info-item">
                    <div class="info-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>
                    </div>
                    <div>
                        <h4>Email</h4>
                        <p>admissions@bbdu.ac.in<br>info@bbdu.ac.in</p>
                    </div>
                </div>
            </div>

            <div class="map-container" style="margin-top:20px;">
                <iframe
                    src="https://www.google.com/maps?q=Lucknow,Uttar%20Pradesh&output=embed"
                    width="100%" height="280" loading="lazy"
                    title="Babu Banarasi Das University Location">
                </iframe>
            </div>
        </div>

    </div>
</section>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
