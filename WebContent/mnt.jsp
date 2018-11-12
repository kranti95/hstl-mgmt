<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
form{
color="white";
display:table;
padding:18px;
background-color:cyan;
border:solid 2px red;
}
.row{
display:table-row;
}
.row label{
display:table-cell;
padding:2px;
text-align:left;
}
.row input{
display:table-cell;
padding:2px;
}
.hd{
background-color:powderblue;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
//System.out.println(id);
String name="";
long num=Long.parseLong(id);
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hostel","mgmt");
Statement s=con.createStatement();
ResultSet rs=s.executeQuery("select name from newuserreg where adm='"+num+"' ");
if(rs.next())
{
 name=rs.getString(1);
}


%>


<div class="hd"><center><h2>SRI VENKATESWARA UNIVERSITY</h2>
<h3>BOYS HOSTEL MANAGEMENT</h3></center>
<hr size=4 color="yellow"></div>
<center>
<form action="fees.jsp">
<div class="row">
<label for="student name">Student name:</label>
<input type="text" value="<% out.print(name); %>" name="sname" readonly><br><br>
</div>

<div class="row">
<label for="student name">Admission number:</label>
<input type="text" name="id" value="<% out.print(num); %>" ><br><br>
</div>

<div class="row"><label for="mn">Month:</label>
<input type="month" value="" name="mn"><br><br>
</div>
&emsp;&emsp;&emsp;<input type="submit">
</form>
</center>

</body>
</html>