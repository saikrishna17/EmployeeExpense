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
	ResultSet rs,rs2,rs3;
	Statement st,st2,st3;
	String idemp=request.getParameter("id");
	session.setAttribute("empuse",idemp);
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
	           st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY); 
	           st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY); 
	           st3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	           rs=st.executeQuery("select * from empdet where id='"+idemp+"'");
	           rs2=st2.executeQuery("select * from eadd where id='"+idemp+"'");
	           rs3=st3.executeQuery("select * from salary where id='"+idemp+"'");
	           rs.first();
	           rs2.first();
	           rs3.first();

	           %>
	           <div class='esrchdiv'>
	           <TABLE class='esrch'>
	           <tr><td><b>Name</b></td><td><%out.println(rs.getString(2));%></td></tr>
	           <tr><td><b>Employee Id</b></td><td><%out.println(rs.getString(3));%></td></tr>
	           <tr><td><b>Phone No:</b></td><td><%out.println(rs.getString(4));%></td></tr>
	           <tr><td><b>Date Of Birth</b></td><td><%out.println(rs.getString(5));%></td></tr>
	           <tr><td><b>Gender</b></td><td><%out.println(rs.getString(6));%></td></tr>
	           <tr><td><b>Email</b></td><td><%out.println(rs.getString(7));%></td></tr>
	           <tr><td><b>Department</b></td><td><%out.println(rs.getString(8));%></td></tr>
	           <tr><td><b>Designation</b></td><td><%out.println(rs.getString(9));%></td></tr>
	           <tr><td><b>Supervisor</b></td><td><%out.println(rs.getString(10));%></td></tr>
	           <tr><td><b>Amount eligibility</b></td><td><%out.println(rs.getString(11));%></td></tr>
	           <tr><td><b>Employee type</b></td><td><%out.println(rs.getString(12));%></td></tr>
	           <tr><td><b>Account Department</b></td><td><%out.println(rs.getString(13));%></td></tr>
	           <tr><td><b>Address:</b></td><td><%out.println(rs2.getString(2));%>,<%out.println(rs2.getString(3));%>,<%out.println(rs2.getString(4));%>,<%out.println(rs2.getString(5));%>,<%out.println(rs2.getString(6));%>,<%out.println(rs2.getString(7));%></td></tr>
	           <tr><td><b>Salary</b></td><td><%out.println(rs3.getString(2));%></td></tr>
	           <tr><td><b>Fare Allowance(%)</b></td><td><%out.println(rs3.getString(3));%></td></tr>
	           <tr><td><b>Halting Allowance(%)</b></td><td><%out.println(rs3.getString(4));%></td></tr>
	           <tr><td><b>Conveyance Allowance(%)</b></td><td><%out.println(rs3.getString(5));%></td></tr>
	           <tr><td><b>Other Allowance(%)</b></td><td><%out.println(rs3.getString(6));%></td></tr>

</TABLE>
</div>
<%
con.close();
}
catch(Exception e)
{
    System.out.println(e);
}
%><p class="editb"><a href="empedit.jsp">Edit</a></p>	 
</body>
</html>