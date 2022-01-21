package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import entities.User;
import services.UserService;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService us=new UserService();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getParameter("op") != null) {
            if (request.getParameter("op").equals("load")) {
                response.setContentType("application/json");
                List<User> users = us.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(users));
                
            }else if(request.getParameter("op").equals("delete")) {
            	int id=Integer.parseInt(request.getParameter("id"));
            	us.delete(us.findById(id));
            	
                response.setContentType("application/json");
                List<User> users = us.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(users));
                
            }else if(request.getParameter("op").equals("update")) {
            	int id=Integer.parseInt(request.getParameter("id"));
            	String login = request.getParameter("login");
                String password = request.getParameter("password");
                int isAdmin = Integer.parseInt(request.getParameter("isAdmin"));
                
                User u=us.findById(id);
                u.setIsAdmin(isAdmin);
                u.setPassword(password);
                u.setLogin(login);
                us.update(u);
                response.setContentType("application/json");
                List<User> users = us.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(users));
                
            }
        } else {
        	
        	int i=0;
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            int isAdmin = Integer.parseInt(request.getParameter("isAdmin"));
            List<User> users = us.findAll();
            for (User u : users) {
				if(login.equals(u.getLogin())) {
					i=1;
					//response.sendRedirect("usertt.jsp?message=User already exists !");
		            break;
				}
					
			}
           
            if(i==0) {
            	us.create(new User(login, password, isAdmin));
            }else {
            	//response.sendRedirect("userAdmin.jsp?message=User already exists !");
            }
            
            
            response.setContentType("application/json");
            //List<User> users = us.findAll();
            Gson json = new Gson();
            response.getWriter().write(json.toJson(users));
        }
	}

}
