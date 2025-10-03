<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
  
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Online Voting System</title>
      
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
       <%@include file="navbar.jsp" %>
     <style>
        
       body {
            background: #f8f9fa;
        }
        .hero {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                        url('<%=request.getContextPath()%>/image/vote.png') no-repeat center center/cover;
            color: white;
            height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: bold;
        }
        .footer {
            background: #212529;
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<section class="hero">
    <div class="container">
        <h1>Welcome to Online Voting System</h1>
        <p class="lead mt-3">Vote securely, fairly, and easily from anywhere.</p>
        <a href="index.jsp" class="btn btn-primary btn-lg mt-3">Get Started</a>
    </div>
</section>
<div class="container mt-5">
    <div class="row text-center">
        <div class="col-md-4 mb-3">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title">Easy Registration</h5>
                    <p class="card-text">Create your account quickly and get ready to cast your vote securely.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title">Secure Voting</h5>
                    <p class="card-text">Your vote is encrypted and confidential, ensuring fair results.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title">Live Results</h5>
                    <p class="card-text">Track the voting results in real-time with full transparency.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
