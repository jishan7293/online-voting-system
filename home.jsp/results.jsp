<%@ page import="java.sql.*,dao.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Live Voting Results</title>
<!-- Auto refresh every 3 seconds -->
<meta http-equiv="refresh" content="3">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <%@include file="navbar.jsp" %>
  </head>
<body class="bg-light">

<div class="container mt-4">
    <div class="row">
        <div class="col-12 text-center mb-4">
            <h2>Voting Results</h2>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-12 col-md-8">
            <div class="table-responsive">
                <table class="table table-bordered table-striped text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>Candidate</th>
                            <th>Election Symbol</th>
                            <th>Votes</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        Connection con = DBUtil.getConnection();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM candidates");
                        while(rs.next()){
                    %>
                        <tr>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("Election_Symbol") %></td>
                            <td><%= rs.getInt("voteCount") %></td>
                        </tr>
                    <%
                        }
                        rs.close();
                        st.close();
                        con.close();
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-12 text-center">
            <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
