<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="pr3.css" type="text/css" media="screen">
</head>
<body>
<div class='phead'></div>
<nav></nav>
<%@page import="java.sql.*"%>
<%
try{
	String str1=request.getParameter("date");
    String str2=request.getParameter("cname");
    String str3=request.getParameter("add");
    String str4=request.getParameter("city");
    String str5=request.getParameter("state");
    String str6=request.getParameter("zip");
    String str7=request.getParameter("phno");
    String str8=request.getParameter("fax");
    String str9=request.getParameter("email");
    String str10=request.getParameter("web");
    int a=Integer.parseInt(str6);
    //int b=Integer.parseInt(str7);
    int c=Integer.parseInt(str8);
    session.setAttribute("email",str9);
    Class.forName("com.ibm.db2.jcc.DB2Driver");
   
    Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
Statement st=con.createStatement();  
           st.executeUpdate("insert into reg values ('"+str1+"','"+str2+"','"+str3+"','"+str4+"','"+str5+"',"+a+",'"+str7+"',"+c+",'"+str9+"','"+str10+"')"); %>
           	        	
           
           <div class="afterreg"><H1>Thankyou for registering your company</H1>
                   <h2>Its successfully registered.</h2>
           <P>Click on the button below to register the admin of your company</P>
           <FORM METHOD=POST ACTION="">
           	<INPUT TYPE="button" VALUE="Admin" ONCLICK="parent.location='adminreg.html'">
           </FORM></div>
    <% 
    con.close();        
}
    catch(Exception e)
    {
    System.out.println(e);
    }
     %>


<div id="footer">
		<p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a></p>
	</div>
</body>
</html>