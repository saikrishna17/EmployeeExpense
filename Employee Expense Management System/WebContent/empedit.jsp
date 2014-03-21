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
	String empuse=(String)session.getAttribute("empuse");
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
	           st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY); 
	          st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY); 
	          st3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	           rs=st.executeQuery("select * from empdet where id='"+empuse+"'");
	           rs2=st2.executeQuery("select * from eadd where id='"+empuse+"'");
	           rs3=st3.executeQuery("select * from salary where id='"+empuse+"'");

	           rs.first();
	           rs2.first();
	           rs3.first();
	           %>
<form id="formedit" name="formedit" action="alter.jsp" method="post">
<div class="editdiv">
 <TABLE class="edittable">
	           <tr><td>Name:</td><td><INPUT TYPE="text" NAME="str1" value="<%out.println(rs.getString(2));%>"></td></tr>
               <tr><td>Employee Id:</td><td><INPUT TYPE="text" NAME="str2" value="<%out.println(rs.getString(3));%>"></td></tr>
	           <tr><td>Phone No:</td><td><INPUT TYPE="text" NAME="str3" value="<%out.println(rs.getString(4));%>"></td></tr>
	           <tr><td>Date Of Birth:</td><td><INPUT TYPE="text" NAME="str4" value="<%out.println(rs.getString(5));%>"></td></tr>
	           <tr><td>Gender:</td><td><INPUT TYPE="text" NAME="str5" value="<%out.println(rs.getString(6));%>"></td></tr>
	           <tr><td>Email:</td><td><INPUT TYPE="text" NAME="str6" value="<%out.println(rs.getString(7));%>"></td></tr>
	           <tr><td>Department:</td><td><INPUT TYPE="text" NAME="str7" value="<%out.println(rs.getString(8));%>"></td></tr>
	           <tr><td>Designation:</td><td><INPUT TYPE="text" NAME="str8" value="<%out.println(rs.getString(9));%>"></td></tr>
	           <tr><td>Supervisor:</td><td><INPUT TYPE="text" NAME="str81" value="<%out.println(rs.getString(10));%>"></td></tr>
	           <tr><td>Amount eligibility:</td><td><INPUT TYPE="text" NAME="str82" value="<%out.println(rs.getString(11));%>"></td></tr>
	           <tr><td>Employee type:</td><td><INPUT TYPE="text" NAME="str83" value="<%out.println(rs.getString(12));%>"></td></tr>
	           <tr><td>Account Department:</td><td><INPUT TYPE="text" NAME="str84" value="<%out.println(rs.getString(13));%>"></td></tr>

<tr><td>Block/Flat-No:</td><td><INPUT TYPE="text" NAME="str9" value="<%out.println(rs2.getString(2));%>"></td></tr>
<tr><td>Locality/Village:</td><td><INPUT TYPE="text" NAME="str10" value="<%out.println(rs2.getString(3));%>"></td></tr>
<tr><td>City/Taluk:</td><td><INPUT TYPE="text" NAME="str11" value="<%out.println(rs2.getString(4));%>"></td></tr>
<tr><td>District:</td><td><INPUT TYPE="text" NAME="str12" value="<%out.println(rs2.getString(5));%>"></td></tr>
<tr><td>State:</td><td><INPUT TYPE="text" NAME="str13" value="<%out.println(rs2.getString(6));%>"></td></tr>
<tr><td>Pincode:</td><td><INPUT TYPE="text" NAME="str14" value="<%out.println(rs2.getString(7));%>"></td></tr>
	           <tr><td>Salary:</td><td><INPUT TYPE="text" NAME="str15" value="<%out.println(rs3.getString(2));%>"></td></tr>
	           <tr><td>Fare Allowance(%):</td><td><INPUT TYPE="text" NAME="str16" value="<%out.println(rs3.getString(3));%>"></td></tr>
	           <tr><td>Halting Allowance(%):</td><td><INPUT TYPE="text" NAME="str17" value="<%out.println(rs3.getString(4));%>"></td></tr>
	           <tr><td>Conveyance Allowance(%):</td><td><INPUT TYPE="text" NAME="str18" value="<%out.println(rs3.getString(5));%>"></td></tr>
	           <tr><td>Other Allowance(%):</td><td><INPUT TYPE="text" NAME="str19" value="<%out.println(rs3.getString(6));%>"></td></tr>

</TABLE>
</div>
<INPUT TYPE="submit" id="edits" >
</form>
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