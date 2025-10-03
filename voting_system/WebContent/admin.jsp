<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Panel - Voting System</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-12 col-md-6">
            <div class="card shadow p-3">
                <div class="card-body text-center">
                    <h2 class="card-title mb-4">Admin Panel</h2>
                    <div class="d-grid gap-3">
                         <a href="voteViews.jsp" class="btn btn-success btn-lg">View Candidate</a>
                       
                        <a href="results.jsp" class="btn btn-primary btn-lg">View Live Results</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
