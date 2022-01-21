package controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import connexion.Connexion;
import entities.Machine;
import entities.Salle;
import entities.User;
import services.MachineService;
import services.SalleService;
import services.UserService;

/**
 * Servlet implementation class GenerateReportController
 */
@WebServlet("/GenerateReportController")
public class GenerateReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MachineService ms=new MachineService();
	private UserService us=new UserService();
	private SalleService ss=new SalleService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter pw=response.getWriter();
		
		if(request.getParameter("op").equals("user")) {
			try {
				Document document = new Document();
	        
				OutputStream file = new FileOutputStream(new File("C://Users//hp//Desktop//Liste des utilisateurs.pdf"));
	            PdfWriter.getInstance(document, file);
	            
	            document.open();
	            
	            
	            
	            
	            document.add(new Paragraph("Liste des utilisateurs ",new Font(Font.FontFamily.TIMES_ROMAN,22.0f,Font.UNDERLINE,BaseColor.RED)));
	            document.add(new Paragraph("                                                    "));
	             document.add(new Paragraph("                                                    "));
	             document.add(new Paragraph());
	            
	            
	            
	            PdfPTable tb1 = new PdfPTable(4);
	            
	            
	            
	            
	            tb1.addCell("Id");
	            tb1.addCell("Login");
	            tb1.addCell("Password");
	            tb1.addCell("isAdmin");
	            
	         
	                
	            
	            List<User> users=us.findAll();
	            //pw.print("<h1>+"+ users.size() +"</h1>");
	            
	            for(int i=0;i<users.size();i++) {
	            	tb1.addCell(String.valueOf(users.get(i).getId()));
	            	tb1.addCell(users.get(i).getLogin());
	            	tb1.addCell(users.get(i).getPassword());
	            	if(users.get(i).getIsAdmin()==0) {
	            		tb1.addCell("Non");
	            	}else {
	            		tb1.addCell("Oui");
	            	}
	            	

	            }
	            
	        	
					document.add(tb1);
					document.close();
					
					response.setContentType("application/json");
		            //List<User> users = us.findAll();
		            Gson json = new Gson();
		            response.getWriter().write(json.toJson(users));
		            
			} catch (Exception e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
			}
	            
			
		}else if(request.getParameter("op").equals("salle")) {
			try {
				Document document = new Document();
	        
				OutputStream file = new FileOutputStream(new File("C://Users//hp//Desktop//Liste des salles.pdf"));
	            PdfWriter.getInstance(document, file);
	            
	            document.open();
	            
	            
	            
	            
	            document.add(new Paragraph("Liste des salles ",new Font(Font.FontFamily.TIMES_ROMAN,22.0f,Font.UNDERLINE,BaseColor.RED)));
	            document.add(new Paragraph("                                                    "));
	             document.add(new Paragraph("                                                    "));
	             document.add(new Paragraph());
	            
	            
	            
	            PdfPTable tb1 = new PdfPTable(3);
	            
	            
	            
	            
	            tb1.addCell("Id");
	            tb1.addCell("Code");
	            tb1.addCell("Type");
	           
	            
	         
	                
	            
	            List<Salle> salles=ss.findAll();
	            //pw.print("<h1>+"+ users.size() +"</h1>");
	            
	            for(int i=0;i<salles.size();i++) {
	            	tb1.addCell(String.valueOf(salles.get(i).getId()));
	            	tb1.addCell(salles.get(i).getCode());
	            	tb1.addCell(salles.get(i).getType());
	            	

	            }
	            
	        	
					document.add(tb1);
					document.close();
					
					response.setContentType("application/json");
		            //List<User> users = us.findAll();
		            Gson json = new Gson();
		            response.getWriter().write(json.toJson(salles));
		            
			} catch (Exception e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(request.getParameter("op").equals("machine")) {
			try {
				Document document = new Document();
	        
				OutputStream file = new FileOutputStream(new File("C://Users//hp//Desktop//Liste des machines.pdf"));
	            PdfWriter.getInstance(document, file);
	            
	            document.open();
	            
	            
	            
	            
	            document.add(new Paragraph("Liste des machines ",new Font(Font.FontFamily.TIMES_ROMAN,22.0f,Font.UNDERLINE,BaseColor.RED)));
	            document.add(new Paragraph("                                                    "));
	             document.add(new Paragraph("                                                    "));
	             document.add(new Paragraph());
	            
	            
	            
	            PdfPTable tb1 = new PdfPTable(6);
	            
	            
	            
	            
	            tb1.addCell("Id");
	            tb1.addCell("Reference");
	            tb1.addCell("Marque");
	            tb1.addCell("Date d'achat");
	            tb1.addCell("Prix");
	            tb1.addCell("Salle (Code_Type)");
	           
	            
	         
	                
	            
	            List<Machine> machines=ms.findAll();
	            //pw.print("<h1>+"+ users.size() +"</h1>");
	            
	            for(int i=0;i<machines.size();i++) {
	            	tb1.addCell(String.valueOf(machines.get(i).getId()));
	            	tb1.addCell(machines.get(i).getReference());
	            	tb1.addCell(machines.get(i).getMarque());
	            	tb1.addCell(String.valueOf(machines.get(i).getDateAchat()));
	            	tb1.addCell(String.valueOf(machines.get(i).getPrix()));
	            	tb1.addCell(machines.get(i).getSalle().getCode()+"_"+machines.get(i).getSalle().getType());
	            	

	            }
	            
	        	
					document.add(tb1);
					document.close();
					
					response.setContentType("application/json");
		            //List<User> users = us.findAll();
		            Gson json = new Gson();
		            response.getWriter().write(json.toJson(machines));
		            
			} catch (Exception e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(request.getParameter("op").equals("searchv1")) {
			try {
				Document document = new Document();
	        
				OutputStream file = new FileOutputStream(new File("C://Users//hp//Desktop//Liste des machines par dates.pdf"));
	            PdfWriter.getInstance(document, file);
	            
	            document.open();
	            
	            
	            
	            
	            document.add(new Paragraph("Liste des machines par dates ",new Font(Font.FontFamily.TIMES_ROMAN,22.0f,Font.UNDERLINE,BaseColor.RED)));
	            document.add(new Paragraph("                                                    "));
	             document.add(new Paragraph("                                                    "));
	             document.add(new Paragraph());
	            
	            
	            
	            PdfPTable tb1 = new PdfPTable(6);
	            
	            
	            
	            
	            tb1.addCell("Id");
	            tb1.addCell("Reference");
	            tb1.addCell("Marque");
	            tb1.addCell("Date d'achat");
	            tb1.addCell("Prix");
	            tb1.addCell("Salle (Code_Type)");
	           
	            
	         
	                
	           
	            List<Machine> machines=ms.findAll();
	            //pw.print("<h1>+"+ users.size() +"</h1>");
	            
	            for(int i=0;i<machines.size();i++) {
	            	tb1.addCell(String.valueOf(machines.get(i).getId()));
	            	tb1.addCell(machines.get(i).getReference());
	            	tb1.addCell(machines.get(i).getMarque());
	            	tb1.addCell(String.valueOf(machines.get(i).getDateAchat()));
	            	tb1.addCell(String.valueOf(machines.get(i).getPrix()));
	            	tb1.addCell(machines.get(i).getSalle().getCode()+"_"+machines.get(i).getSalle().getType());
	            	

	            }
	            
	        	
					document.add(tb1);
					document.close();
					
					response.setContentType("application/json");
		            //List<User> users = us.findAll();
		            Gson json = new Gson();
		            response.getWriter().write(json.toJson(machines));
		            
			} catch (Exception e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(request.getParameter("op").equals("searchv2")) {
			try {
				Document document = new Document();
	        
				OutputStream file = new FileOutputStream(new File("C://Users//hp//Desktop//Liste des machines par salles.pdf"));
	            PdfWriter.getInstance(document, file);
	            
	            document.open();
	            
	            
	            
	            
	            document.add(new Paragraph("Liste des machines par salles ",new Font(Font.FontFamily.TIMES_ROMAN,22.0f,Font.UNDERLINE,BaseColor.RED)));
	            document.add(new Paragraph("                                                    "));
	             document.add(new Paragraph("                                                    "));
	             document.add(new Paragraph());
	            
	            
	            
	            PdfPTable tb1 = new PdfPTable(6);
	            
	            
	            
	            
	            tb1.addCell("Id");
	            tb1.addCell("Reference");
	            tb1.addCell("Marque");
	            tb1.addCell("Date d'achat");
	            tb1.addCell("Prix");
	            tb1.addCell("Salle (Code_Type)");
	           
	            
	         
	                
	            
	            List<Machine> machines=ms.findAll();
	            //pw.print("<h1>+"+ users.size() +"</h1>");
	            
	            for(int i=0;i<machines.size();i++) {
	            	tb1.addCell(String.valueOf(machines.get(i).getId()));
	            	tb1.addCell(machines.get(i).getReference());
	            	tb1.addCell(machines.get(i).getMarque());
	            	tb1.addCell(String.valueOf(machines.get(i).getDateAchat()));
	            	tb1.addCell(String.valueOf(machines.get(i).getPrix()));
	            	tb1.addCell(machines.get(i).getSalle().getCode()+"_"+machines.get(i).getSalle().getType());
	            	

	            }
	            
	        	
					document.add(tb1);
					document.close();
					
					response.setContentType("application/json");
		            //List<User> users = us.findAll();
		            Gson json = new Gson();
		            response.getWriter().write(json.toJson(machines));
		            
			} catch (Exception e) {
					// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	
	}
}
