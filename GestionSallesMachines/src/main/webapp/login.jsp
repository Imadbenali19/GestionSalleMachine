<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gestion Salle & Machine - Login</title>

    <!-- Custom fonts for this template-->
    <link href="<%= request.getContextPath() %>/template/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%= request.getContextPath() %>/template/css/sb-admin-2.min.css" rel="stylesheet">
<title></title>
</head>
<body style="background-color: antiquewhite;">

<div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body" style="max-height: 400px;margin-top: 38px;">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome back!</h1>
                                    </div>
                                    <form class="user" method="POST" action="${pageContext.request.contextPath}/LoginController" >
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"  name="logintext" placeholder="Login" required="required">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"  name="passwordtext" placeholder="Password" required="required">
                                        </div>
                                        
                                        <input type="submit" class="btn btn-primary btn-user btn-block" name="login" value="Sign in" />
                                           
                                       
                                        
                                    </form>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<%= request.getContextPath() %>/template/vendor/jquery/jquery.min.js"></script>
    <script src="<%= request.getContextPath() %>/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%= request.getContextPath() %>/template/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%= request.getContextPath() %>/template/js/sb-admin-2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		
		let parameter=new URLSearchParams(window.location.search); 
		if(parameter!=null){
			swal("Error!", parameter.get("message"), "error");
		}
		
		
	</script> 
</body>
</html>