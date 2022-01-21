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
	
	
	<%
		Gson gsonObj2 = new Gson();
		Map<Object,Object> map2 = null;
		List<Map<Object,Object>> list2 = new ArrayList<Map<Object,Object>>();
		String dataPoints2 = null;
	 
		try{
			ResultSet rs = null;
			String  xVal2,yVal2;
			String query = "select count(*) as nb, marque as m from machine group by marque;";
		    PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
		    rs = statement.executeQuery();
		    while (rs.next()) {
		    	xVal2=rs.getString("nb");
		    	yVal2=rs.getString("m");
		    	map2 = new HashMap<Object,Object>();
		    	map2.put("y", xVal2);
		    	map2.put("x", yVal2);
		    	list2.add(map2);
				dataPoints2 = gsonObj.toJson(list2);
				
		    }
			
		}
		catch(SQLException e){
			out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
			dataPoints2 = null;
		}
	%>
	
	<%
		Gson gsonObj3 = new Gson();
		Map<Object,Object> map3 = null;
		List<Map<Object,Object>> list3 = new ArrayList<Map<Object,Object>>();
		String dataPoints3 = null;
	 
		try{
			ResultSet rs = null;
			String  xVal3,yVal3;
			String query = "select count(*) as nb, dateAchat as m from machine group by dateAchat;";
		    PreparedStatement statement = Connexion.getInstane().getConnection().prepareStatement(query);
		    rs = statement.executeQuery();
		    while (rs.next()) {
		    	xVal3=rs.getString("nb");
		    	yVal3=rs.getString("m");
		    	map3 = new HashMap<Object,Object>();
		    	map3.put("y", xVal3);
		    	map3.put("x", yVal3);
		    	list3.add(map3);
				dataPoints3 = gsonObj.toJson(list3);
				
		    }
			
		}
		catch(SQLException e){
			out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
			dataPoints3 = null;
		}
	%>
	
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Gestion Salle & Machine - chartsAdmin</title>
<%@ include file="/include/head.jsp"%>

</head>
<body id="page-top">
<%@ include file="loginVerification.jsp"%>
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
						<h1 class="h3 mb-0 text-gray-800">Statistiques</h1>
						
					</div>

					<!-- Content Row -->
					
					
					<div id="chartContainer" style="height: 315px; margin: auto;width: 75%;"></div>
					<br>
					<div id="chartContainer2" style="height: 315px; margin: auto;width: 75%;"></div>
					<br>
					<div id="chartContainer3" style="height: 315px; margin: auto;width: 75%;"></div>


				</div>

				<!-- ---------------------------------------------------------------------------------------------- -->

			</div>
			<%@ include file="/include/footer.jsp"%>
		</div>
	</div>
	<%@ include file="/include/scriptsPath.jsp"%>
	
	<script type="text/javascript">
		window.onload = function() { 
			<%-- <% if(dataPoints != null) { %> --%>
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
			<%-- <% } %>  --%>
			
			<%-- <% if(dataPoints2 != null) { %> --%>
				var chart2 = new CanvasJS.Chart("chartContainer2", {
					animationEnabled: true,
					//exportEnabled: true,
					axisY:{includeZero:true,title:"Nombre de machines"},
					axisX:{includeZero:true,title:"Marque"},
					title: {
						text: "Nombre de machines par marque"
					},
					data: [{
						type: "pie", 
						yValueFormatString:"#,##0.#"%"",
						indexLabel: "{x} ({y})",
						dataPoints: <%out.print(dataPoints2);%> 
						
						
					}]
				});
				chart2.render();
			<%-- <% } %>  --%>
			
			<%-- <% if(dataPoints3 != null) { %> --%>
				var chart3 = new CanvasJS.Chart("chartContainer3", {
					animationEnabled: true,
					//exportEnabled: true,
					axisY:{includeZero:true,title:"Nombre de machines achetées"},
					axisX:{includeZero:true,title:"Date d'achat"},
					title: {
						text: "Nombre de machines achetées par date d'achat"
					},
					data: [{
						type: "pie", 
						yValueFormatString:"#,##0.#"%"",
						indexLabel: "{x} ({y})",
						dataPoints: <%out.print(dataPoints3);%> 
						
						
					}]
				});
				chart3.render();
			<%-- <% } %>  --%>
		}
	</script>


<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
	<script type="text/javascript">
		document.getElementsByClassName('nav-item')[5].className+=" active";
	</script>


</html>