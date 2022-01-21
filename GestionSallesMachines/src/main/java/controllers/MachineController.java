package controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import entities.Machine;
import entities.Salle;
import entities.User;
import services.MachineService;
import services.SalleService;

/**
 * Servlet implementation class MachineController
 */
@WebServlet("/MachineController")
public class MachineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MachineService ms=new MachineService();
	private SalleService ss=new SalleService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MachineController() {
        super();
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
                List<Machine> machines = ms.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(machines));
                
            }else if(request.getParameter("op").equals("delete")) {
            	int id=Integer.parseInt(request.getParameter("id"));
            	ms.delete(ms.findById(id));
            	
                response.setContentType("application/json");
                List<Machine> machines = ms.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(machines));
                
            }else if(request.getParameter("op").equals("update")) {
            	
            	int id=Integer.parseInt(request.getParameter("id"));
            	String reference = request.getParameter("reference");
                String marque = request.getParameter("marque");
                String dateAchat = request.getParameter("dateAchat");
                Double prix=Double.parseDouble(request.getParameter("prix"));
                String salleString=request.getParameter("salle");
                String[] code=salleString.split("_");
                
                Salle salle= (Salle) ss.findSalleByCode(code[0]);
                
                Machine m=ms.findById(id);
                m.setMarque(marque);
                m.setReference(reference);
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                try {
					m.setDateAchat(new Date(sdf.parse(dateAchat).getTime()));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                m.setSalle(salle);
                m.setPrix(prix);
                ms.update(m);
                response.setContentType("application/json");
                List<Machine> machines = ms.findAll();
                Gson json = new Gson();
                response.getWriter().write(json.toJson(machines));
                
            }else if(request.getParameter("op").equals("searchv1")) {
            	
                String d1 = request.getParameter("date1");
                String d2 = request.getParameter("date2");
                //Date date1=new Date(request.getParameter("date1"));
                
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
               
//					Date date1=new Date(sdf.parse(d1).getTime());
//					Date date2=new Date(sdf.parse(d2).getTime());
					response.setContentType("application/json");
	                List<Machine> machines;
					try {
						machines = ms.findMachineBetween2Dates(new Date(sdf.parse(d1).getTime()), new Date(sdf.parse(d2).getTime()));
						Gson json = new Gson();
		                response.getWriter().write(json.toJson(machines));
					} catch (ParseException e) {
						 
						e.printStackTrace();
					}
                
            }else if(request.getParameter("op").equals("searchv2")) {
            	
            	int salleID=Integer.parseInt(request.getParameter("salle")) ;
    
				response.setContentType("application/json");
	            List<Machine> machines= ms.findMachinebySalle(ss.findById(salleID));
				Gson json = new Gson();
		        response.getWriter().write(json.toJson(machines));
				
                
            }
		}
		else{
			
			String reference = request.getParameter("reference");
			String marque = request.getParameter("marque");
	        Double prix = Double.parseDouble(request.getParameter("prix"));
	        String dateAchat = request.getParameter("dateAchat");
	        String salleString=request.getParameter("salle");
	        String[] code=salleString.split("_");
	        
	        Salle salle= ss.findSalleByCode(code[0]);
	        //Date dateAchat = new Date(request.getParameter("dateAchat").replace("-", "/"));
	        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	        try {
				ms.create(new Machine(reference,marque, new Date(sdf.parse(dateAchat).getTime()),salle, prix));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       
	        //response.sendRedirect("machineAdmin.jsp?message=fait");
	        response.setContentType("application/json");
	        List<Machine> machines = ms.findAll();
	        Gson json = new Gson();
	        response.getWriter().write(json.toJson(machines));
	        
        }
	}
	
}
