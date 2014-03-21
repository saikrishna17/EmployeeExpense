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
	ResultSet rs;
	Statement st;
	String id=(String)session.getAttribute("id");

	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
	    %>
<div class='esrchdiv'>
<TABLE class='esrch'>
<tr><th>Sent By</th><th>Title</th></tr>
	    <%        
	    st=con.createStatement(); 
	//    con.setAutoCommit(false);
	  //  System.out.println("hel1");
	  System.out.println(id);
	           rs=st.executeQuery("select * from inbox where toid='"+id+"'");
	           //System.out.println("hel2");
	           while(rs.next())
	           {
	           System.out.println("hel3");
	           %>
	           <tr><td><a href="vview.jsp?id=<%=rs.getString(2)%>&sender=<%=rs.getString(3)%>"><%out.println(rs.getString(3));%></a></td>
	           <%System.out.println("hel4"); %>
	           <td><a href="vview.jsp?id=<%=rs.getString(2)%>&sender=<%=rs.getString(3)%>"><%out.println(rs.getString(5));%></a></td></tr>
<%
	           }
	           //con.commit();
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