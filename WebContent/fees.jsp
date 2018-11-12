
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>studentmonth</title>
<style type="text/css">
form{
color="white";
display:table;
padding:18px;
background-color:none;
border:none;
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
body{
background:linear-gradient(white,green);
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="hd"><center><h2>SRI VENKATESWARA UNIVERSITY</h2>
<h3>BOYS HOSTEL MANAGEMENT</h3></center>
<hr size=4 color="yellow"></div>

<%
String veg="";
String id=request.getParameter("id");
//System.out.println(id);
long num=Long.parseLong(id);
String mn=request.getParameter("mn");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hostel","mgmt");
 Statement s=con.createStatement();
 ResultSet rs=s.executeQuery("select veg from newuserreg where adm='"+num+"' ");
 if(rs.next())
 {
	 veg=rs.getString(1);
 }
 ResultSet r=s.executeQuery("select * from monthly where mnt='"+mn+"' ");
 if(r.next()){
	 %>
	 
	 <center><h3><u>Student Month Bill</u></h3>
<form action="std.jsp">
<div class="row">
<label for="student name">Student name:</label>
<input type="text" value="<% out.print(r.getString(1)); %>" name="sname" readonly><br><br>
</div>
<div class="row">
<label for="ad no">Admn no:</label>
<input type="text" value="<% out.print(r.getLong(2)); %>" name="id" hidden readonly><br><br>
</div>
<div class="row"><label for="mn">Month:</label>
<input type="text" value="<% out.print(r.getString(3)); %>" name="mn" readonly><br><br>
</div>
<div class="row"><label for="rm">Room charges:</label>
<input type="text" value="<% out.print(r.getFloat(7)); %>" name="rm" readonly><br><br>
</div>

<div class="row"><label for="day">days:</label>
<input type="text" value="<% out.print(r.getInt(5)); %>" name="day" readonly><br><br>
</div>
<div class="row"><label for="ld">leave days:</label>
<input type="text" value="<% out.print(r.getInt(6)); %>" name="ld" readonly><br><br>
</div>
<div class="row"><label for="cc">non_veg:</label>
<input type="text" value="<% out.print(r.getString(4)); %>" name="cc" readonly><br><br>
</div>
<div class="row"><label for="nv">type:</label>
<input type="text" value="<% out.print(veg); %>" name="nv" readonly><br><br>
</div>
<div class="row"><label for="bt">total bill:</label>
<input type="text" value="<% out.print(r.getFloat(8)); %>" name="bt" readonly><br><br>
</div>
	 <center>&emsp;<input type="submit" value="Back to student home"></center>
	 </form></center>
	 
	 <% 
	 
	 
	 
	 
 }else{
	 
	%>
	<h1>Opps !.. data is not available of this month</h1>
	<form action="std.jsp"><input type="text" name="id" value="<%out.print(num); %>" hidden>
	<input type="submit" value="back to student home"></form>
	<%
	 
 }
 
}catch(Exception e)
{
	System.out.println(e);
}






%>

</body>
</html>