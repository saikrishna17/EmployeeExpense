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
	String id=(String)session.getAttribute("id");
	String comp=(String)session.getAttribute("comp");
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
	    %>
<div class='esrchdiv'>
<TABLE class='esrch'>
<tr><th>Voucher ID</th><th>Date</th><th>Status</th></tr>
	    <%        
	    st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
	           rs=st.executeQuery("select * from voucher where sender='"+id+"'");
	           while(rs.next())
	           {
	        	   String status="Pending";
	           %>
	           <tr><td><a href="vviewadmin.jsp?id=<%=rs.getString(1)%>"><%String vd=rs.getString(1);out.println(vd);%></a></td>
	           <td><a href="vviewadmin.jsp?id=<%=rs.getString(2)%>"><%out.println(rs.getString(2));%></a></td>
	          
	           <% 
	           st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
	           rs2=st2.executeQuery("select * from approve where vid='"+vd+"'");
	           if(rs2.isBeforeFirst())
		          {
	        	   System.out.println("hf");
	           rs2.next();
	           status="Approved";
		          }
	           else
	           {
	        	   st3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
		           rs3=st3.executeQuery("select * from dapprove where vid='"+vd+"'");
		           if(rs3.isBeforeFirst())
			          {
		        	   
		           rs3.next();
		           status="Disapproved";
	           }
		          }%>
	           <td><a href="vviewadmin.jsp?id=<%=rs.getString(1)%>"><%=status%></a></td></tr>
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