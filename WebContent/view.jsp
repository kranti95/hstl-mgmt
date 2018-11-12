<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table{
margin-bottom:40px;
}
.h{
padding-left:10px;
padding-right:10px;
background-color:blue;
margin:5px;
height:25px;
color:white;
text-shadow:2px 2px 3px green;
}
a{
float:left;
color:white;
font-weight:bold;
margin-left:10px;
background-color:black;
border-radius:15px;
padding:2px;
text-decoration:none;

}
</style>
</head>
<body background="drak.jpg">
<center><a href="view.html">Back to home</a></center>
<div class="h"><center><h3><u>Student details</u></h3></center></div>

<%

String crs=request.getParameter("crs");
String hst=request.getParameter("hst");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hostel","mgmt");
 	Statement st=con.createStatement();
 	ResultSet r=st.executeQuery("select name,sname,gender,dt,dpt,crs,adm,mb,email,veg,hst from  newuserreg where crs='"+crs+"'and hst='"+hst+"' ");
 	%>
 <table bgcolor="#00BB00" width="100%" border="2">
<tr><th bgcolor="#FF0000">NAME</th><th bgcolor="#FF0000">SURNAME</th><th bgcolor="#FF0000">GENDER</th><th bgcolor="#FF0000">DOB</th><th bgcolor="#FF0000">DEPTNAME</th><th bgcolor="#FF0000">COURSE</th><th bgcolor="#FF0000">ADMNO</th><th bgcolor="#FF0000">MOBILE</th><th bgcolor="#FF0000">EMAIL</th><th bgcolor="#FF0000">TYPE</th><th bgcolor="#FF0000">HOSTEL</th>
</tr>
 
 	<%
 	while(r.next())
 	{
 		%>
 		

 		<tr><td><%=r.getString(1) %></td>
 		<td><%=r.getString(2) %></td>
 		<td><%=r.getString(3) %></td>
 		<td><%=r.getString(4) %></td>
 		<td><%=r.getString(5) %></td>
 		<td><%=r.getString(6) %></td>
 		<td><%=r.getLong(7) %></td>
 		<td><%=r.getLong(8) %></td>
 		<td><%=r.getString(9) %></td>
 		<td><%=r.getString(10) %></td>
 		<td><%=r.getString(11) %></td>
 		</tr>
 		
 		
 		<% 
 		 
 	} 

 	}catch(Exception e){
	
	System.out.println(e);
}



%>
 </table>

</body>
</html>