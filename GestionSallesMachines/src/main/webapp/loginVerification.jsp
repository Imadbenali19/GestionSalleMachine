<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>

<%

response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Expires","0");
if(session.getAttribute("login")==null){
	response.sendRedirect("login.jsp");
}


%>


</body>
</html>