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
<body>
<%try{
String name=request.getParameter("name");
String sname=request.getParameter("sname");
String fname=request.getParameter("fname");
String mname=request.getParameter("mname");
String gen=request.getParameter("gender");
String dt=request.getParameter("dt");
String crs=request.getParameter("crs");
String cte=request.getParameter("ct");
String dpt=request.getParameter("dpt");
String adn=request.getParameter("adm");
Long adno=Long.parseLong(adn);
String veg=request.getParameter("veg");
String pass=request.getParameter("pass");
String mb=request.getParameter("mb");
Long mbn=Long.parseLong(mb);
String email=request.getParameter("email");
String hst=request.getParameter("hst");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","hostel","mgmt");
	PreparedStatement ps=con.prepareStatement("insert into newuserreg values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,sname);
	ps.setString(3,fname);
	ps.setString(4,mname);
	ps.setString(5,gen);
	ps.setString(6,dt);
	ps.setString(7,dpt);
	ps.setString(8,crs);
	ps.setLong(9,adno);
	ps.setLong(10,mbn);
	ps.setString(11,email);
	ps.setString(12,pass);
	ps.setString(13,veg);
	ps.setString(14,hst);
	ps.setString(15,cte);
	int n=ps.executeUpdate();
	if(n>0)
	{
		
		PreparedStatement p=con.prepareStatement("insert into tot_bill(adno,name) values(?,?)");
		p.setLong(1,adno);
		p.setString(2,name);
		p.executeUpdate();
		
		
		%>
		<h1>SUCESSFULLY REGISTERED</a></center></h1>
		<a href="fr.html">Back to Login</a>
		<% 
	}

	
}catch(Exception e){
	out.print(e);
}






%>

</body>
</html>