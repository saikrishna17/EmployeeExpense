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
String success=request.getParameter("success");
if(success==null || success=="null")
{
 success="";
}
%>

<div class='phead'></div>
<div class="logo">
			<img src="images/iclaim.jpg" width="140" height="65" border="0" >
			</div>

<nav>
<p class='lout'><a href='logout.jsp'>Logout</a></p>
<ul>
<li class='drop'><a href='empprofile.jsp'>Home</a></li>
<li class='drop'><a href='#' class='hover'>Voucher</a>
<div class='dropdownContain'>
<div class='dropOut'>
<div class='triangle'></div>
<ul><li><a href='forms.jsp' >Create New</a></li>
</ul></div></div></li></ul></nav>
<div class='aside'>
<div class='navbox'><ul class='navi'>
<li><a href='einbox.jsp'>Inbox 
<%@page import="java.sql.*"%>
<%
try
{
	 response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);

	  if(session.getAttribute("id")==null)
	      response.sendRedirect("index.jsp");
String id=(String)session.getAttribute("id");
int num=0;
Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
Statement st2=con.createStatement(); 
ResultSet rs2=st2.executeQuery("select * from einbox where toid='"+id+"'");
while(rs2.next())
{
	   //String status=rs.getString(5);
	   //String check="check0";
	if(rs2.getString(6).equals("check0"))
{
	num++;
}
}
out.println("("+num+")");
%></a></li><%
       Statement st=con.createStatement(); 
       ResultSet rs=st.executeQuery("select * from einbox where toid='"+id+"'");
       while(rs.next())
       {
    	   //String status=rs.getString(5);
    	   //String check="check0";
    	if(rs.getString(6).equals("check0"))
       {
    	num++;
       }
       }
       Statement st3=con.createStatement(); 
       ResultSet rs3=st3.executeQuery("select * from empdet where id='"+id+"'");
       rs3.next();
       String company=rs3.getString(1);
       String acnt=rs3.getString(13);
       session.setAttribute("comp",company);
%>
</a></li>
<li><a href='draft.jsp'>Drafts</a></li>
<%if(acnt.equals("yes")){ %>
<li><a href='voucherpaid.jsp'>Voucher Paid</a></li>
<%} %>
<li><a href='vouchersent.jsp'>Voucher Sent</a></li></ul>
</div></div>
<%con.close();
}
catch(Exception e)
{
    System.out.println(e);
} %>
<div class="success"><%=success%></div>
<div class='pfoot'></div>
</body>
</html>