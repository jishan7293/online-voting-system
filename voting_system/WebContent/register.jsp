<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register - Voting System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <%@include file="navbar.jsp" %>
   
</head>
<body class=".bg-light.bg-gradient">

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-sm-8 col-10">
            <div class="card shadow mt-5 p-3">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Register</h3>
                    <form action="RegisterServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" class="form-control" placeholder="Enter username" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                        </div>
                        <div class="d-grid">
                            <input type="submit" class="btn btn-primary" value="Register">  </div>
                    </form>
                    <p class="mt-3 text-center">
                        <a href="index.jsp">Back to Login</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="footer.jsp" %>
</body>
</html>
