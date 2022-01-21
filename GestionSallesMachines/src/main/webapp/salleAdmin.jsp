<%@page import="entities.Salle"%>
<%@page import="services.SalleService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Gestion Salle & Machine - SalleAdmin</title>
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
							<h1 class="h4 text-gray-900 mb-4">Add an machine room!</h1>
						</div>
						<form class="user" name="salleForm" id="salleForm">
							<div class="form-group row">
								<div class="col-sm-6 mb-3 mb-sm-0">
									<label>Code</label> <input type="text"
										class="form-control form-control-user" id="code" name="code" placeholder="Code" onchange="validCode()">
									<span id="s1"></span>
								</div>
								<div class="col-sm-6 mb-3 mb-sm-0">
									<label>Type</label> <input type="text"
										class="form-control form-control-user"
										id="type" name="type" placeholder="Type"  onchange="validType()">
									<span id="s2"></span>
								</div>
							</div>

							<!--<input type="submit" class="btn btn-info btn-user btn-block" value="Add" id="add" onclick="valid()"> -->
							<!--<input type="submit" class="btn btn-info btn-user btn-block" value="Update" id="edit" onclick="valid()" hidden> -->
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
                            <h6 class="m-0 font-weight-bold text-primary">Machine Rooms Table</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Code</th>
                                            <th>Type</th>
                                            <th>Action 1</th>
                                            <th>Action 2</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Code</th>
                                            <th>Type</th>
                                            <th>Action 1</th>
                                            <th>Action 2</th>
                                        </tr>
                                    </tfoot>
                                    <tbody id="yes">
                                      <%
                        				SalleService ms = new SalleService();
                                      	int j;
                        				for (Salle m : ms.findAll()) {
                   						 %>
					                    <tr>
					                        <td><%= m.getId()%></td>
					                        <td><%= m.getCode()%></td>
					                        <td><%= m.getType()%></td>
					                        <td><a href="SalleController?id=<%=m.getId()%>&op=update" class="btn btn-warning btn-icon-split"><span class="icon text-white-50"><i class="fas fa-exclamation-triangle"></i></span><span class="text">Modifier</span></a></td>
					                        <td><a href="SalleController?id=<%=m.getId()%>&op=delete" class="btn btn-danger btn-icon-split"><span class="icon text-white-50"><i class="fas fa-trash"></i></span><span class="text">Supprimer</span></a></td>
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
		<script src="<%= request.getContextPath() %>/validationsJS/validation2.js"></script>
		<script src="<%= request.getContextPath() %>/Scripts/salles.js"></script>
</body>
<script type="text/javascript">
	document.getElementsByClassName('nav-item')[2].className += " active";
</script>


</html>