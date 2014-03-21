<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="logo">
		<h1>Employee Expense Management</h1>
	</div>
	<div id="header">
		<div id="menu">
			<ul>
				<li><a href="index.html" class="first">Home</a></li>
				<li class="current_page_item"><a href="#">Services</a></li>
				<li><a href="#">Clients</a></li>
				<li><a href="#">About Us</a></li>
				<li><a href="compreg.html">Register</a></li>
               <li><a href="#">Contact</a></li>
			</ul>
		</div>
	</div>
<%@page import="java.sql.*"%>
<%
try{
	String str1=request.getParameter("fname");
    String str2=request.getParameter("id");
    String str3=request.getParameter("phone");
    String str4=request.getParameter("dob");
    String str5=request.getParameter("gender");
    String str6=request.getParameter("email");
    String str7=request.getParameter("add");
    String str8=request.getParameter("street");
    String str9=request.getParameter("city");
    String str10=request.getParameter("district");
    String str11=request.getParameter("state");
    String str12=request.getParameter("pin");
    String str13=request.getParameter("dep");
    String str14=request.getParameter("desg");
    String str14_2=request.getParameter("super");
    String str14_3=request.getParameter("eamnt");
    String str14_4=request.getParameter("ans");
    String str15=request.getParameter("user");
    String str16=request.getParameter("pswrdc");
    String str16_1=request.getParameter("pay");
    String str18=request.getParameter("fare");
    String str19=request.getParameter("halt");
    String str20=request.getParameter("conv");
    String str21=request.getParameter("oa");
//    int a=Integer.parseInt(str3);
    int b=Integer.parseInt(str12);
    int c=Integer.parseInt(str14_3);
    int d=Integer.parseInt(str16_1);
    int e=Integer.parseInt(str18);
    int f=Integer.parseInt(str19);
    int g=Integer.parseInt(str20);
    int h=Integer.parseInt(str21);
    String str17=(String)session.getAttribute("email");
    Class.forName("com.ibm.db2.jcc.DB2Driver");
    Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
           Statement st=con.createStatement();  
           st.executeUpdate("insert into empdet values ('"+str17+"','"+str1+"','"+str2+"','"+str3+"','"+str4+"','"+str5+"','"+str6+"','"+str13+"','"+str14+"','"+str14_2+"',"+b+",'admin','"+str14_4+"')");
           st.executeUpdate("insert into eadd values ('"+str2+"','"+str7+"','"+str8+"','"+str9+"','"+str10+"','"+str11+"',"+b+")");
           st.executeUpdate("insert into login values ('"+str2+"','"+str15+"','"+str16+"','admin')");
           st.executeUpdate("insert into salary values ('"+str2+"',"+d+","+e+","+f+","+g+","+h+")");
          String message="Now the Admin can Add other Employees" ;
	        response.sendRedirect("index.jsp?error="+message);
%>

<div id="footer">
		<p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a></p>
	</div>

<%
           con.close();	        
}
    catch(Exception e){
    System.out.println(e);
}
%>

</body>
</html>