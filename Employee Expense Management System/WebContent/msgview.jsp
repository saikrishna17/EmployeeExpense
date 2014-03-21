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
try
{
response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  Class.forName("com.ibm.db2.jcc.DB2Driver");
  Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
  if(session.getAttribute("id")==null)
      response.sendRedirect("index.jsp");
ResultSet rs,rs2,rs3;
Statement st,st2,st3;

String id=(String)session.getAttribute("id");
	String msgno=request.getParameter("msgno");
	String sender=request.getParameter("sender");
	
	           st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);  
	           rs=st.executeQuery("select * from empdet where id='"+sender+"'");
	           rs.first();%>
	           <div class='vdiv'><p class='vpar'>From:<%out.println(rs.getString(2));%>
	           </p><br><TABLE class='vtable'>
	          <%
	          st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	          rs2=st.executeQuery("select * from einbox where msgno='"+msgno+"'");
	          if(rs2!=null)
	          {
	        	  rs2.first();
	        	  String msg = rs2.getString(5).replaceAll("\n", "<br/>");
        	   %>
           <tr><td><%out.println(msg);%></td></tr>
           
           <% 
           //}
        	   }%>
	          
	           

</TABLE></div>
<%
st3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
rs3=st3.executeQuery("select * from einbox where msgno='"+msgno+"'");
rs3.first();
String status=rs3.getString(6);
if(status.equals("check0"))
{
	   st3.executeUpdate("update einbox set status='check1' where msgno='"+msgno+"'");
	  
}  
con.close();
}
catch(Exception e)
{
    System.out.println(e);
}
%> 
</body>
</html>