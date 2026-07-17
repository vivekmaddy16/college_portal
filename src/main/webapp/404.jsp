<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Not Found | Babu Banarasi Das University</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" href="favicon.png">
</head>
<body>

<jsp:include page="includes/header.jsp" />

<section class="error-page">
    <div class="container">
        <h1>404</h1>
        <h2>Page Not Found</h2>
        <p>Oops! The page you're looking for doesn't exist or has been moved.</p>
        <a href="index.jsp" class="btn btn-primary">← Back to Home</a>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
