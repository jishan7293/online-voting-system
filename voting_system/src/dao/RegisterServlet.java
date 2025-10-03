package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
                "INSERT INTO users(username,password,role) VALUES(?,?,?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, "USER");
           // ps.executeUpdate(); 
           // res.sendRedirect("index.jsp");
            int i = ps.executeUpdate();

            if(i > 0) {
                res.getWriter().println("<script>"
                        + "alert('Registration Successful! Please login.');"
                        + "window.location='index.jsp';"
                        + "</script>");
            } else {
                res.setContentType("text/html");
                res.getWriter().println("<script>"
                        + "alert('Registration Failed! Try again.');"
                        + "window.location='register.jsp';"
                        + "</script>");
            }
        } catch(Exception e){ e.printStackTrace(); 
        }
    }
		
	}

