<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student view</title>
<style>

.hd{
background-color:powderblue;
}
.menu{
background-color:pink;
height:250px;
width:190px;
margin-left:50px;
margin-top:50px;
margin-right:50px;
margin-bottom:20px;
}

input{
padding:8px;
margin:5px;
color:none;
background-color:none;
border-radius:2px;
}
body{
background-image:url("aaa.jpg");
background-repeat:no-repeat;
background-size:1300px 680px;
}
a{
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
<body>
<%
String id=request.getParameter("id");
System.out.println(id);
long num=Long.parseLong(id);




%> 
<div class="hd"><center><h2>SRI VENKATESWARA UNIVERSITY</h2>
<h3>HOSTEL FEES MANAGEMENT</h3></center>
<hr size=4 color="yellow"></div>
<h3>Welcome to Student page</h3>
<center><div class="menu">
<form action="stdview.jsp"><input type="text" name="id" value="<% out.print(num); %>" hidden><input type="submit" value="View student details"></form><br>
<form action="mnt.jsp"><input type="text" name="id" value="<% out.print(num); %>" hidden><input type="submit" value="Student monthly bill"></form><br>
<form action="tot.jsp"><input type="text" name="id" value="<% out.print(num); %>" hidden><input type="submit" value=" Total bills "></form><br>
<form action="slogin.html"><input type="submit" value="  Log out  "></form>
</div></center>
<center><a href="index.html">click to Home</a></center>
</body>
</html>