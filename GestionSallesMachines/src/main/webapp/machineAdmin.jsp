<%@page import="entities.Machine"%>
<%@page import="entities.Salle"%>
<%@page import="services.MachineService"%>
<%@page import="services.SalleService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<title>Gestion Salle & Machine - MachineAdmin</title>
<%@ include file="/include/head.jsp"%>
<link href="<%= request.getContextPath() %>/template/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
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
						<h1 class="h3 mb-0 text-gray-800">Gestion des machines</h1>
						<a href="javascript:void(0);" id="generate"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>

					<div class="p-5">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4">Add an machine!</h1>
						</div>
						<form class="user" >
							<div class="form-group row">
								<div class="col-sm-6 mb-3 mb-sm-0">
									<label>Reference</label> <input type="text"
										class="form-control form-control-user" id="reference" name="reference" placeholder="Reference" onchange="validReference()" required="required">
									<span id="s1"></span>
								</div>
								<div class="col-sm-6 mb-3 mb-sm-0">
									<label>Brand</label> <input type="text"
										class="form-control form-control-user"
										id="marque" name="marque" placeholder="Brand" onchange="validMarque()" required="required">
									<span id="s2"></span>
								</div>
							</div>
							
							<div class="form-group row">
								<div class="col-sm-6 mb-3 mb-sm-0">
									<label>Date of purchase</label> <input type="date"
										class="form-control form-control-user" id="dateAchat" name="dateAchat" >
								</div>
								<div class="col-sm-6 mb-3 mb-sm-0">
									<label for="salle">Salle(Code _ Type)</label> 
									<select id="salle" name="salle" class=" custom-select" style="border-radius: 10rem; height: calc(1.5em + .75rem + 13px);">
										<%
						                   SalleService sr = new SalleService();
						                   for (Salle l : sr.findAll()) {
						               %>
										<option value="<%=l.getCode()+"_"+l.getType()%>"><%=l.getCode()+"_"+l.getType()%></option>
            
             							<%}%>
									</select>
								</div>
							</div>
							
							<div class="form-group">
									<label>Prix d'achat</label> <input type="number"
										class="form-control form-control-user" id="prix" name="prix" placeholder="Prix d'achat" required="required">
							</div>
							
							<!-- <input type="submit" class="btn btn-info btn-user btn-block" value="Add" id="add" onclick="valid()">-->
							<!-- <input type="submit" class="btn btn-info btn-user btn-block" value="Update" id="edit" onclick="valid()" hidden>-->
							<a href="" class="btn btn-info btn-user btn-block"  id="add" onclick="valid()">Add</a>
							
							<a href="" class="btn btn-info btn-user btn-block" id="edit" onclick="valid()" hidden>Update</a>
						</form>
						
						<hr>
						
						


					</div>

					<!-- ---------------------------------------------------------------------------------------------- -->

					<h1 class="h3 mb-2 text-gray-800">Table</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Machines Table</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Reference</th>
                                            <th>Marque</th>
                                            <th>Date d'achat</th>
                                            <th>Prix d'achat</th>
                                            <th>Salle</th>
                                            <th>Action 1</th>
                                            <th>Action 2</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Reference</th>
                                            <th>Marque</th>
                                            <th>Date d'achat</th>
                                            <th>Prix d'achat</th>
                                            <th>Salle</th>
                                            <th>Action 1</th>
                                            <th>Action 2</th>
                                        </tr>
                                    </tfoot>
                                    <tbody id="yes">
		                                 <%
	                        				MachineService ms = new MachineService();
	                                      	int j;
	                        				for (Machine m : ms.findAll()) {
                        					
                   						 %>
					                    <tr>
					                        <td><%= m.getId()%></td>
					                        <td><%= m.getReference()%></td>
					                        <td><%= m.getMarque()%></td>
					                        <td><%= m.getDateAchat() %></td>
					                        <td><%= m.getPrix() %></td>
					                        <td><%= m.getSalle().getCode()+"_"+m.getSalle().getType() %></td>
					                        <td><a href="MachineController?id=<%=m.getId()%>&op=update" class="btn btn-warning btn-icon-split"><span class="icon text-white-50"><i class="fas fa-exclamation-triangle"></i></span><span class="text">Modifier</span></a></td>
					                        <td><a href="MachineController?id=<%=m.getId()%>&op=delete" class="btn btn-danger btn-icon-split"><span class="icon text-white-50"><i class="fas fa-trash"></i></span><span class="text">Supprimer</span></a></td>
					                    </tr> 
					                    <%}%>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
					
					
					
					
					
				</div>
				<%@ include file="/include/footer.jsp"%>
			</div>
		</div>
		<%@ include file="/include/scriptsPath.jsp"%>
		<script src="<%= request.getContextPath() %>/validationsJS/validation3.js"></script>
		<script src="<%= request.getContextPath() %>/Scripts/machines.js"></script> 
		
		<script type="text/javascript">
			 $("#generate").click(function() {				
				
				//alert("Good job!", "User added successfully!", "success");
				$.ajax({
					url: "./GenerateReportController",
					data: { op: "machine"},
					type: 'POST',
					success: function(data) {
						swal("PDF generated !", {
						      icon: "success",
						    });
						remplir(data);
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus);
						//swal("Error!", "User not added", "error");
					}
				}); 
			}); 
		
		</script>
</body>
<script type="text/javascript">

	document.getElementsByClassName('nav-item')[3].className += " active";
	
	document.getElementById("dateAchat").value= formatDate(new Date());
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();
	
	    if (month.length < 2) 
	        month = '0' + month;
	    if (day.length < 2) 
	        day = '0' + day;
	
	    return [year, month, day].join('-');
	}
</script>


</html>