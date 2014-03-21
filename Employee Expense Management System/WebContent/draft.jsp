<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="pr3.css" type="text/css" media="screen">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<div class='esrchdiv'>
<TABLE class='esrch'>
<%@page import="java.sql.*"%>
<%
try{
	response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);

	  if(session.getAttribute("id")==null)
	      response.sendRedirect("index.jsp");
	String id=(String)session.getAttribute("id");
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select vid from vdrafts where sender='"+id+"'");
while(rs.next())
{
	%>
		           <tr><td><form><INPUT TYPE="checkbox"></form></td><td><a href="dview.jsp?id=<%=rs.getString(1)%>">Voucher ID=<%out.println(rs.getString(1));%></a></td></tr>
	
	<%
}
}
catch(Exception e)
{
    System.out.println(e);
}
%>
</TABLE>
<input type='submit' id="delb" value='delete'>
</div>
</body>
</html>