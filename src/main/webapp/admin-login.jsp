<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | Babu Banarasi Das University</title>
    <meta name="description" content="Administrator portal login for Babu Banarasi Das University.">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" href="favicon.png">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<!-- ===== HERO SUB ===== -->
<section class="hero hero-sub">
    <div class="container">
        <div class="hero-content">
            <h1>Admin <span>Portal</span></h1>
            <p>Access control for student registrations and admissions pipeline.</p>
        </div>
    </div>
</section>

<!-- ===== LOGIN FORM SECTION ===== -->
<section class="section">
    <div class="container" style="max-width:480px;">

        <div class="section-heading" style="margin-bottom:32px;">
            <span class="tag">Security</span>
            <h2>Sign In</h2>
            <p>Please enter your administrative credentials below.</p>
        </div>

        <%
            String status = request.getParameter("status");
            if ("failed".equals(status)) {
        %>
            <div class="alert-error">❌ Invalid username or password. Please try again.</div>
        <% } %>

        <form id="loginForm" action="admin-login-submit" method="post">
            <div class="form-group">
                <label for="username">Username *</label>
                <input type="text" id="username" name="username" placeholder="Enter admin username" required autocomplete="username">
            </div>
            <div class="form-group">
                <label for="password">Password *</label>
                <input type="password" id="password" name="password" placeholder="Enter admin password" required autocomplete="current-password">
            </div>
            <button type="submit" class="btn btn-primary" style="width:100%; margin-top:12px;">Login →</button>
        </form>

        <p style="text-align:center; margin-top:20px; font-size:13px; color:var(--gray-500);">
            Note: Default credentials are <strong>admin</strong> / <strong>admin123</strong>.
        </p>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
