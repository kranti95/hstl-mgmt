<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String user=request.getParameter("user");
String pass=request.getParameter("pass");
if(user.equals("admin") && pass.equalsIgnoreCase("123456"))
		{
	response.sendRedirect("admin.html");
		}
else{
	out.println("<h1><a href=index.html> your login failed</a><h1>");
}


%>
</body>
</html>