package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class VoteServlet
 */
@WebServlet("/VoteServlet")
public class VoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		res.setContentType("text/html");
		 HttpSession session = req.getSession();
	        int userId = (int) session.getAttribute("userId");
	        int candidateId = Integer.parseInt(req.getParameter("candidateId"));

	        try(Connection con = DBUtil.getConnection()) {
	            PreparedStatement psCheck = con.prepareStatement(
	                "SELECT hasVoted FROM users WHERE id=?");
	            psCheck.setInt(1,userId);
	            ResultSet rs = psCheck.executeQuery();
	            if(rs.next() && rs.getBoolean("hasVoted")) {
	            	
	            	res.getWriter().println("<script>alert('You have already voted!'); window.location='dashboard.jsp';</script>");

	                return;
	            }

	            PreparedStatement psVote = con.prepareStatement(
	                "UPDATE candidates SET voteCount=voteCount+1 WHERE id=?");
	            psVote.setInt(1,candidateId);
	            psVote.executeUpdate();

	            PreparedStatement psInsert = con.prepareStatement(
	            	    "INSERT INTO votes(userId,candidateId) VALUES(?,?)");
	            	psInsert.setInt(1, userId);
	            	psInsert.setInt(2, candidateId);
	            	psInsert.executeUpdate();

	            PreparedStatement psUser = con.prepareStatement(
	                "UPDATE users SET hasVoted=TRUE WHERE id=?");
	            psUser.setInt(1,userId);
	            psUser.executeUpdate();
	        	res.getWriter().println("<script>alert('Your Vote Successfull Complate You Can Go !'); window.location='dashboard.jsp';</script>");

	           // res.sendRedirect("dashboard.jsp");
	        } catch(Exception e){ e.printStackTrace(); }
	    }
		
}


