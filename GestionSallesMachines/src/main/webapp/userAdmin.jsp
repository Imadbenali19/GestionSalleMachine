<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="entities.User"%>
<%@page import="services.UserService"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Gestion Salle & Machine - UserAdmin</title>
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
						<h1 class="h3 mb-0 text-gray-800">Gestion des utilisateurs</h1>
						
						<a href="javascript:void(0);" id="generate"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>

					<div class="p-5">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4">Add an user!</h1>
						</div>
						
						<form class="user" name="userForm" id="userForm">
							<div class="form-group row">
								<div class="col-sm-6 mb-3 mb-sm-0">
									<label>Login</label> <input type="text"
										class="form-control form-control-user" id="login" name="login"
										placeholder="Login" onchange="validNom()" required="required">
									<span id="s1"></span>
								</div>
								<div class="col-sm-6 mb-3 mb-sm-0">
									<label for="admin">Admin?</label> 
									<select id="admin" class=" custom-select" name="admin" style="border-radius: 10rem; height: calc(1.5em + .75rem + 13px);">
										<option value="Non">Non</option>
										<option value="Oui">Oui</option>
										
									</select>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-sm-6 mb-3 mb-sm-0">
									<label>Password</label> <input type="password"
										class="form-control form-control-user"
										id="password" name="password" placeholder="Password" onchange="validPassword()" data-toggle="password" required="required">
									<label class="uuu">
										<input type="checkbox" class="methods" />
										<i class="fa fa-eye yyy"></i>
										<i class="fa fa-eye-slash yyy"></i>
									</label>
									<span id="s2"></span>
									
								</div>
								
								<div class="col-sm-6">
									<label>Confirmation of Password?</label> <input
										type="password" class="form-control form-control-user"
										id="rpassword" name="rpassword" placeholder="Repeat Password" onchange="validConfPassword()"  required="required">
									<label class="uuu">
										<input type="checkbox" class="methods" />
										<i class="fa fa-eye yyy"></i>
										<i class="fa fa-eye-slash yyy"></i>
									</label>
									<span id="s3"></span>
								</div>
								
							</div>
							<!-- <input type="submit" class="btn btn-info btn-user btn-block" value="Add" id="add" onclick="valid()"> -->
							<a href="" class="btn btn-info btn-user btn-block"  id="add" onclick="valid()">Add</a>
							<!-- <input type="submit" class="btn btn-info btn-user btn-block" value="Update" id="edit" onclick="valid()" hidden> -->
							<a href="" class="btn btn-info btn-user btn-block" id="edit" onclick="valid()" hidden>Update</a>
								
								

						</form>
						
						<hr>
						
						



					</div>

					<!-- ---------------------------------------------------------------------------------------------- -->

					<h1 class="h3 mb-2 text-gray-800">Table</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">User Table</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Login</th>
                                            <th>Password</th>
                                            <th>Admin ?</th>
                                            <th>Action 1</th>
                                            <th>Action 2</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Id</th>
                                            <th>Login</th>
                                            <th>Password</th>
                                            <th>Admin ?</th>
                                            <th>Action 1</th>
                                            <th>Action 2</th>
                                        </tr>
                                    </tfoot>
                                    <tbody id="yes">
                                      <%
                        				UserService ms = new UserService();
                                      	int j;
                        				for (User m : ms.findAll()) {
                        					j=0;
                        					if(m.getIsAdmin()==1){
                        						j=1;
                        					}
                   						 %>
					                    <tr>
					                        <td><%= m.getId()%></td>
					                        <td><%= m.getLogin()%></td>
					                        <td><%= m.getPassword()%></td>
					                        <td><%= j %></td>
					                        <td><a href="UserController?id=<%=m.getId()%>&op=update" class="btn btn-warning btn-icon-split"><span class="icon text-white-50"><i class="fas fa-exclamation-triangle"></i></span><span class="text">Modifier</span></a></td>
					                        <td><a href="UserController?id=<%=m.getId()%>&op=delete" class="btn btn-danger btn-icon-split"><span class="icon text-white-50"><i class="fas fa-trash"></i></span><span class="text">Supprimer</span></a></td>
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
		<script src="<%= request.getContextPath() %>/validationsJS/validation1.js"></script>
		<script src="<%= request.getContextPath() %>/Scripts/users.js"></script>
		
		
		
		
</body>
<script type="text/javascript">
	document.getElementsByClassName('nav-item')[1].className += " active";
	
	$(document).ready(function () {
		$('.methods').eq(0).click(function () {
			$('#password').attr('type', $(this).is(':checked') ? 'text' : 'password');
			
		});
		$('.methods').eq(1).click(function () {
			$('#rpassword').attr('type', $(this).is(':checked') ? 'text' : 'password');
			
		});
	});
	  
</script>


<script type="text/javascript">

	let parameter=new URLSearchParams(window.location.search); 
	if(parameter!=null){
		swal("Error!", parameter.get("message"), "error");
	}


</script> 



<style>

	.methods {
	  position: absolute;
	  top: 45%;
	  left: 93%;
	  z-index: 10;
	  opacity: 0;
	}
	.methods:hover {
	  cursor: pointer;
	}
	.methods:checked ~ .fa-eye-slash {
	  opacity: 0.2;
	}
	.methods:checked ~ .fa-eye {
	  opacity: 0;
	}
	.yyy {
	  position: absolute;
	  top: 43%;
	  left: 90%;
	  font-size: 1.5rem;
	  color: black !important;
	  opacity: 0.5;
	}
	.fa-eye-slash {
	  opacity: 0;
	}
</style>

</html>