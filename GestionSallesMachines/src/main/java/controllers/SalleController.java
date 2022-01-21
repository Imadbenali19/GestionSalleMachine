package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import entities.Salle;
import services.SalleService;


/**
 * Servlet implementation class SalleController
 */
@WebServlet("/SalleController")
public class SalleController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private SalleService us=new SalleService();
    /**
     * Default constructor. 
     */
    public SalleController() {
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("op") != null) {
            if (request.getParameter("op").equals("load")) {
                response.setContentType("application/json");
                List<Salle> salles = us.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(salles));
                
            }else if(request.getParameter("op").equals("delete")) {
            	int id=Integer.parseInt(request.getParameter("id"));
            	us.delete(us.findById(id));
            	
                response.setContentType("application/json");
                List<Salle> salles = us.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(salles));
                
            }else if(request.getParameter("op").equals("update")) {
            	int id=Integer.parseInt(request.getParameter("id"));
            	String code = request.getParameter("code");
                String type = request.getParameter("type");
                
                Salle u=us.findById(id);
                u.setCode(code);
                u.setType(type);
                us.update(u);
                response.setContentType("application/json");
                List<Salle> salles = us.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(salles));
                
            }
        } else {
        	int i=0;
        	String code = request.getParameter("code");
            String type = request.getParameter("type");
           
            List<Salle> salles = us.findAll();
            for (Salle u : salles) {
				if(code.equals(u.getCode())) {
					
					
					i=1;
					
		            break;
				}
					
			}
            
            if(i==0) {
            	us.create(new Salle(code, type));
            }else {
            	//response.sendRedirect("salleAdmin.jsp?message=User already exists !");
            }
            
            
            response.setContentType("application/json");
            //List<User> users = us.findAll();
            Gson json = new Gson();
            response.getWriter().write(json.toJson(salles));
        }
	}

}
