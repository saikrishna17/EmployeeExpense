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
<% 
String type=(String)session.getAttribute("type");
if(type.equals("admin"))
{
%>
<%@ include file="profile.jsp" %>
<%
}
else if(type.equals("manager"))	
{
%>
<%@ include file="profileman.jsp" %>
<%
}
else
{
%>
<%@ include file="empprofile.jsp" %>
<%} %>
<%@page import="java.sql.*"%>
<% 
try{
	 response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);

	  if(session.getAttribute("id")==null)
	      response.sendRedirect("index.jsp");
	ResultSet rs,rs2,rs3,rs4,rs5;
	Statement st,st2,st3,st4,st5;
	String vid=request.getParameter("id");
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
    st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        rs=st.executeQuery("select * from voucher where vid='"+vid+"'");
        if(rs!=null)
        {
      	  rs.first();
	           %>
	           <div class='vdiv'>
	           <p class='vpar'>From:<%out.println(rs.getString(6));%>
	           <br>Voucher ID:<%out.println(rs.getString(1));%></p><br>
	           <TABLE class='vtable'> 
	           
	          <%
	        
        	   %>
        	    <tr><td>Date:</td><td><%out.println(rs.getString(5));%></td></tr>
           <tr><td>Places Visited:</td><td><%out.println(rs.getString(2));%></td></tr>
           <tr><td>Date Of Departure</td><td><%out.println(rs.getString(3));%></td></tr>
           <tr><td>Date Of Arrival</td><td><%out.println(rs.getString(4));%></td></tr>
           <tr><td><br></td><td></td></tr>
           <% 
        	   }%>
	      
	           <%
	           
	          
	        	 
	        	  st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
		           rs2=st2.executeQuery("select * from vfare where vid='"+vid+"'");
		           if(rs2.isBeforeFirst())
			          {
	        	  rs2.first();
	        	   %>
	           <tr><td class='vfont'>FARE CHARGES:</td><td></td></tr>
	           <tr><td>Travelling Date:</td><td><%out.println(rs2.getString(2));%></td></tr>
	           <tr><td>From:</td><td><%out.println(rs2.getString(3));%></td></tr>
	           <tr><td>To:</td><td><%out.println(rs2.getString(4));%></td></tr>
	           <tr><td>Mode Of Transport:</td><td><%out.println(rs2.getString(5));%></td></tr>
	           <tr><td>Class Of Travel:</td><td><%out.println(rs2.getString(6));%></td></tr>
	           <tr><td>Fare:</td><td><%int famnt=Integer.parseInt(rs2.getString(7));%></td></tr>
	           <tr><td>Ticket No:</td><td><%out.println(rs2.getString(8));%></td></tr>
	           <tr><td><br></td><td></td></tr>
	           <% }%>
	           <%
	          
		       
		        	  st3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
			           rs3=st3.executeQuery("select * from vhalt where vid='"+vid+"'");
			           if(rs3.isBeforeFirst())
				          {
			           rs3.first();
	        	   %>
	           <tr><td class='vfont'>Halting Allowances:</td><td></td></tr>
	           <tr><td>Loading Charges:</td><td><%int loamnt=Integer.parseInt(rs3.getString(2));out.println(loamnt);%></td></tr>
	           <tr><td>Boarding Charges:</td><td><%;int boamnt=Integer.parseInt(rs3.getString(3));out.println(boamnt);%></td></tr>
	           <tr><td><br></td><td></td></tr>
	           <% }%>
	           <%
	        
		       
		        	 st4=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			           rs4=st4.executeQuery("select * from vcon where vid='"+vid+"'");
			           if(rs4.isBeforeFirst())
				          {
			           rs4.first();
	        	   %>
	           <tr><td class='vfont'>Conveyance Charges:</td><td></td></tr>
	           <tr><td>Residential Address</td><td><%out.println(rs4.getString(2));%></td></tr>
	           <tr><td>Date:</td><td><%out.println(rs4.getString(3));%></td></tr>
	           <tr><td>From:</td><td><%out.println(rs4.getString(4));%></td></tr>
	           <tr><td>To:</td><td><%out.println(rs4.getString(5));%></td></tr>
	           <tr><td>Aprx Distance</td><td><%out.println(rs4.getString(6));%></td></tr>
	           <tr><td>Mode Of Conveyance</td><td><%out.println(rs4.getString(7));%></td></tr>
	           <tr><td>Charges Paid:</td><td><%int camnt=Integer.parseInt(rs4.getString(8));%></td></tr>
               <tr><td>Remarks:</td><td><%out.println(rs4.getString(9));%></td></tr>
               <tr><td><br></td><td></td></tr>
               <% }%>
               <%
 	           
 	        	  st5=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
 	               rs5=st5.executeQuery("select * from vother where vid='"+vid+"'");
 	              if(rs5.isBeforeFirst())
 		          {
 	               rs5.first();
	        	   %>
               <tr><td class='vfont'>Other Expenses:</td><td></td></tr>
               <tr><td>Particulars:</td><td><%out.println(rs5.getString(2));%></td></tr>
               <tr><td>Amount:</td><td><%int oamnt=Integer.parseInt(rs5.getString(3));out.println(oamnt);%></td></tr>
               <tr><td>Remarks:</td><td><%out.println(rs5.getString(4));%></td></tr>
              <tr><td><br></td><td></td></tr>
              <%
              }
              %>

</TABLE></div>
<%
con.close();
}
catch(Exception e)
{
    System.out.println(e);
}
%>

</body>
</html>