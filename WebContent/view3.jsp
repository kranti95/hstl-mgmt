<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.hd{
background-color:powderblue;
}
table{
margin-bottom:30px;}
input{
width:100px;
height:30px;
color:white;
background-color:black;
font-weight:bold;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="9k.jpg">
<div class="hd"><center><h2>SRI VENKATESWARA UNIVERSITY</h2>
<h3>HOSTEL FEES MANAGEMENT</h3></center>
<hr size=4 color="yellow"></div>
<center><h3><u>Students list(New join)</u></h3></center>

<%
String crs=request.getParameter("crs");
int count=1;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hostel","mgmt");
 	Statement st=con.createStatement();
 	ResultSet s=st.executeQuery("select * from stujoin where course='"+crs+"'");
 	if(!s.next())
 	{
 		out.println("<a href=index.html>no data found</a>");
 	}
 	else
 	{
 do
 		{
 			%>
 			
 			
 			<center><table border="1" >
<tr>
<th>&emsp;sno&emsp;</th>
<th>&emsp;&emsp;&emsp;&emsp;Name&emsp;&emsp;&emsp;&emsp; </th>
<th>&emsp;&emsp;Admn no&emsp;&emsp;</th>
<th>&emsp;Course&emsp;</th>
</tr>
<tr><td><%= count++ %></td><td><%= s.getString(1) %></td><td><%= s.getLong(2) %></td><td><%= s.getString(3) %></td></tr>
</table><center>
 			<% 
 		
 		}while(s.next());
 	}
	
	
}catch(Exception e)
{
	System.out.println(e);
}



%>
<a href="view.html"><input type="button" value="Back to home"></a>
</body>
</html>