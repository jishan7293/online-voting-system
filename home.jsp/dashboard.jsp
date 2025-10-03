<%@ page import="java.sql.*,dao.DBUtil" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard - Voting System</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <%@include file="navbar.jsp" %>
   
</head>
<body class="bg-light">

<div class="container mt-4">
    <div class="row">
        <div class="col-12 text-center mb-4">
            <h2>Welcome, <%= session.getAttribute("username") %></h2>
            <h4>Vote Your Candidate</h4>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-12 col-md-8">
            <div class="table-responsive">
                <table class="table table-bordered table-striped text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>Candidate</th>
                            <th>Election_Symbol</th>
                            <th>Vote</th>
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
                            <td>
                                <form action="VoteServlet" method="post">
                                    <input type="hidden" name="candidateId" value="<%= rs.getInt("id") %>">
                                    <button type="submit" class="btn btn-primary btn-sm">Vote</button>
                                </form>
                            </td>
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
    <a href="Home.jsp" class="btn btn-success" 
   onclick="return confirm('Thank you for voting! Click OK to proceed.');">
   Logout
</a>



        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
