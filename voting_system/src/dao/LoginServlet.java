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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String username = req.getParameter("username");
	        String password = req.getParameter("password");

	        try(Connection con = DBUtil.getConnection()) {
	            PreparedStatement ps = con.prepareStatement(
	                "SELECT * FROM users WHERE username=? AND password=?");
	            ps.setString(1, username);
	            ps.setString(2, password);
	            ResultSet rs = ps.executeQuery();

	            HttpSession session = req.getSession();
				if(rs.next()) {
	               
	                session.setAttribute("username", username);
	                session.setAttribute("role", rs.getString("role"));
	                session.setAttribute("userId", rs.getInt("id"));
	                if(rs.getString("role").equals("ADMIN"))
	                	//res.sendRedirect("admin.jsp");
	                	
	                res.getWriter().println("<script>"
	                        + "alert('Successfully Logged in as Admin!');"
	                        + "window.location='admin.jsp';"
	                        + "</script>");
	                else 
	                	res.getWriter().println("<script>"
	                            + "alert('Successfully Logged in!');"
	                            + "window.location='dashboard.jsp';"
	                            + "</script>");
	                	//res.sendRedirect("dashboard.jsp");
	            } else {
	            	
	            	res.getWriter().println("<script>alert('Invalid Credentials!'); window.location='index.jsp';</script>");

	            }
				
	        } catch(Exception e){ e.printStackTrace(); }
	    }
	}

