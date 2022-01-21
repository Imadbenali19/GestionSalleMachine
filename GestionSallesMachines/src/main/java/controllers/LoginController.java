package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connexion.Connexion;


/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			
	        String login= request.getParameter("logintext");
	        String password= request.getParameter("passwordtext");

	   
	        
	        try {
	            String query = "select * from user where login=? and password=?;";
	            PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
	            statement.setString(1, login);
	            statement.setString(2, password);
	            ResultSet rs = statement.executeQuery();
	            
	            if (rs.next()) {
	                HttpSession session=request.getSession();
	                session.setAttribute("login", rs.getString("login"));
	                response.sendRedirect("index.jsp?message=Vous etes connectes !");
	            }else {
//	            	request.setAttribute("message", "Login ou mot de passe invalide !");
//	                getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
	            	response.sendRedirect("login.jsp?message=Login ou mot de passe invalide !");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		
        
	}

}
