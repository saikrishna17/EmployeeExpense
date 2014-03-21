<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="pr3.css" type="text/css" media="screen">
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
<%@page import="java.sql.*"%>
<%
try{
	  response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);

	  if(session.getAttribute("id")==null)
	      response.sendRedirect("index.jsp");
	ResultSet rs;
	Statement st;
	String id=(String)session.getAttribute("id");
	String comp=(String)session.getAttribute("comp");
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
	    %>
<div class='esrchdiv'>
<TABLE class='esrch'>
<tr><th>Voucher ID</th><th>Approved By</th><th>Paid/Unpaid</th></tr>
	    <%        
	    st=con.createStatement(); 
	           rs=st.executeQuery("select * from approve where comp='"+comp+"'");
	           while(rs.next())
	           {
	           %>
	           <tr><td><a href="vviewadmin.jsp?id=<%=rs.getString(1)%>"><%out.println(rs.getString(1));%></a></td>
	           <td><a href="vviewadmin.jsp?id=<%=rs.getString(1)%>"><%out.println(rs.getString(2));%></a></td>
	           <td><a href="vviewadmin.jsp?id=<%=rs.getString(1)%>"><%out.println(rs.getString(3));%></a></td></tr>
<%
	           }
con.close();
}
catch(Exception e)
{
  System.out.println(e);
}
%>
</TABLE>
</div>
</body>
</html>