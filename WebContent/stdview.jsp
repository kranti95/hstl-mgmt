 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.h{
padding-left:10px;
padding-right:10px;
background-color:blue;
margin:5px;
height:px;
color:white;
text-shadow:2px 2px 3px green;
}
table{
margin-bottom:25px;
margin-top:20px;
}


</style>

</head>
<body background="drak.jpg">
<div class="h"><center>STUDENT DETAILS</center></div>
<table bgcolor="#00FF00" width="100%" border="2">
<tr><th bgcolor="#FF0000">NAME</th><th bgcolor="#FF0000">SURNAME</th><th bgcolor="#FF0000">GENDER</th><th bgcolor="#FF0000">DOB</th><th bgcolor="#FF0000">DEPTNAME</th><th bgcolor="#FF0000">COURSE</th><th bgcolor="#FF0000">ADMNO</th><th bgcolor="#FF0000">MOBILE</th><th bgcolor="#FF0000">EMAIL</th><th bgcolor="#FF0000">FOODTYPE</th><th bgcolor="#FF0000">HOSTEL</th>
</tr>

<%
String user="";
long pass=0;
String crs=request.getParameter("id");
long num=Long.parseLong(crs);
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hostel","mgmt");
 	Statement st=con.createStatement();
 	ResultSet r=st.executeQuery("select name,sname,gender,dt,dpt,crs,adm,mb,email,veg,hst,pass from  newuserreg where adm='"+num+"'");
 	while(r.next())
 	{
 		user=r.getString(9);
 		System.out.println(user);
 		pass=r.getLong(7);
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
 		</table>
 		<% 
 		 
 	}
}catch(Exception e){
	
	System.out.println(e);
}



%>
<center><form action="sloginget.jsp"><input type="text" value="<% out.print(user); %>" name="user" hidden>
<input type="text" value="<% out.print(pass); %>" name="pass" hidden>
<a href="index.html">

<input type="submit" value="back to home"></form></center></a>

</body>
</html>