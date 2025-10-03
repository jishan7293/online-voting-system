<%@ page import="java.sql.*, dao.DBUtil" %>
<%@ page session="true" %>
<%
    // Ensure only admin can view
    String role = (String) session.getAttribute("role");
    if(role == null || !role.equals("ADMIN")) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Voter Details - Admin Panel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <%@include file="navbar.jsp" %>
   
</head>
<body class=".bg-light.bg-gradient">

<div class="container mt-4">
    <h2 class="mb-4 text-center">Who Voted for Which Candidate</h2>
    <table class="table table-bordered table-striped text-center">
        <thead class="table-dark">
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Candidate ID</th>
                <th>Candidate Name</th>
                <th>Vote Time</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Connection con = DBUtil.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(
                		   "SELECT u.id AS userId, u.username AS userName, " +
                                   "c.id AS candidateId, c.name AS candidateName, v.timestamp " +
                                   "FROM votes v " +
                                   "JOIN users u ON v.userId = u.id " +
                                   "JOIN candidates c ON v.candidateId = c.id " +
                                   "ORDER BY v.timestamp DESC"
                );

                while(rs.next()){
        %>
            <tr>
                <td><%= rs.getInt("userId") %></td>
                <td><%= rs.getString("userName") %></td>
                <td><%= rs.getInt("candidateId") %></td>
                <td><%= rs.getString("candidateName") %></td>
                <td><%= rs.getTimestamp("timestamp") %></td>
            </tr>
        <%
                }
                rs.close();
                st.close();
                con.close();
            } catch(Exception e) {
                out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>

    <a href="admin.jsp" class="btn btn-secondary mt-3">Back to Admin Panel</a>
</div>
<%@include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
