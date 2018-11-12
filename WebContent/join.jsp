<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
a{
color:white;
font-weight:bold;
margin-left:10px;
background-color:navy;
border-radius:15px;
padding:2px;
text-decoration:none;

}

</style>
</head>
<body>


<%

String name=request.getParameter("name");
String adno=request.getParameter("adno");
long no=Long.parseLong(adno);
String crs=request.getParameter("crs");
try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hostel","mgmt");
 PreparedStatement ps=con.prepareStatement("insert into stujoin values(?,?,?)");
 ps.setString(1,name);
 ps.setLong(2,no);
 ps.setString(3,crs);
	int n=ps.executeUpdate();
	if(n>0)
	{
		out.print(" <center><h2>sucessfully registered</h2></center>");
		out.print(" <center><h4>Please submit your documents at office</h4> </center>");
	}
	
}catch(Exception e)
{
	System.out.println(e);
}











%>
<center><h4><a href="index.html">&emsp;Home&emsp;</a></h4></center>


</body>
</html>