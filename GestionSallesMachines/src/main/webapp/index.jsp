<%@page import="services.UserService"%>
<%@page import="connexion.Connexion"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%
		Gson gsonObj = new Gson();
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		String dataPoints = null;
	 
		try{
			ResultSet rs = null;
			String  xVal,yVal;
			String query = "select count(*) as nb,s.code as code,s.type as type from machine m,salle s where m.idSalle=s.id group by s.code;";
		    PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
		    rs = statement.executeQuery();
		    while (rs.next()) {
		    	xVal=rs.getString("nb");
		    	yVal=rs.getString("code")+"_"+rs.getString("type");
		    	map = new HashMap<Object,Object>();
		    	map.put("y", xVal);
		    	map.put("x", yVal);
		    	list.add(map);
				dataPoints = gsonObj.toJson(list);
				
		    }
			
		}
		catch(SQLException e){
			out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
			dataPoints = null;
		}
	%>

	
	
	
<!DOCTYPE html>
<html>
<head>
<%@ include file="loginVerification.jsp"%>
<meta charset="ISO-8859-1">
<title>Gestion Salle & Machine - dashboard</title>
<%@ include file="/include/head.jsp"%>

</head>
<body id="page-top">

	<div id="wrapper">
		<%@ include file="/include/sidebar.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="/include/header.jsp"%>

				<!-- ---------------------------------------------------------------------------------------------- -->

				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
						
					</div>

					<!-- Content Row -->
					<div class="row">
						<%
							UserService us = new UserService();	
							
						%>
						<!-- Users -->
						<div class="col-xl-4 col-md-6 mb-6">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body" >
									<div class="row no-gutters align-items-center">
										<div class="col mr-4">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">Utilisateurs de l'application</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
									
												<%= us.getNbUser()%>
							
											</div>
										</div>
										<div class="col-auto">
											<i class="fa fa-user fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Salles -->
						<div class="col-xl-4 col-md-6 mb-6">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-4">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">Salles dans l'application</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
											
											<%= us.getNbSalle()%>
											
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-building fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Machines -->
						<div class="col-xl-4 col-md-6 mb-6">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-4">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Machines dans l'application</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
											<%= us.getNbMachine() %>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-desktop fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>
					
					
					
					<!-- <h2 class="h3 mb-0 text-gray-800 text-center">Nombre de machines par salles</h2> -->
					
																								
							<div id="chartContainer" style="height: 338px; margin: auto;width: 75%;"></div>
								
						
				</div>
				
				<!-- ---------------------------------------------------------------------------------------------- -->

			</div>
			
			<%@ include file="/include/footer.jsp"%>
		</div>
	</div>
	
	<%@ include file="/include/scriptsPath.jsp"%>
	
	<script type="text/javascript">
		
		let parameter=new URLSearchParams(window.location.search); 
		if(parameter!=null){
			swal("Good!", parameter.get("message"), "success");

		}
		
		
	</script> 
	
	
	<script type="text/javascript">
		window.onload = function() { 
			
				var chart = new CanvasJS.Chart("chartContainer", {
					animationEnabled: true,
					//exportEnabled: true,
					axisY:{includeZero:true,title:"Nombre de machines"},
					axisX:{includeZero:true,title:"Salle"},
					title: {
						text: "Nombre de machines par salle (code_type)"
					},
					data: [{
						type: "pie", 
						yValueFormatString:"#,##0.#"%"",
						indexLabel: "{x} ({y})",
						dataPoints: <%out.print(dataPoints);%> 
						
						
					}]
				});
				chart.render();
			
			 
			}
	</script>


<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

</body>
	<script type="text/javascript">
		document.getElementsByClassName('nav-item')[0].className+=" active";
	</script>


</html>