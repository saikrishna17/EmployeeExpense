<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function check2() {
	   var arrMarkMail = document.getElementsByName("arrayb");
	   for (var i = 0; i < arrMarkMail.length; i++) {
	      arrMarkMail[i].checked = true;
	}
}
</script>

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
<form  action="einboxdel.jsp">
<div class='einbox'>
<TABLE class='esrch'>
<tr><th><input type="button" onclick="check2()" value="checkall"></th><th>From ID</th><th>Title</th></tr>
<% try
{
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(session.getAttribute("id")==null)
    response.sendRedirect("index.jsp");
ResultSet rs,rs1;
Statement st,st1;
String id=(String)session.getAttribute("id");
Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
	    st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	    rs=st.executeQuery("select * from empdet where id='"+id+"'");
	    rs.first();
	    	   st1=con.createStatement(); 
	           rs1=st1.executeQuery("select * from einbox where toid='"+id+"'");
	           while(rs1.next())
	           {
	           %>
	           <tr><td><INPUT TYPE="checkbox" name="arrayb" value="<%=rs1.getString(1)%>"></td><td><a href="msgview.jsp?msgno=<%=rs1.getString(1)%>&sender=<%=rs1.getString(2)%>"><%=rs1.getString(2)%></a></td>
	           <td><a href="msgview.jsp?msgno=<%=rs1.getString(1)%>&sender=<%=rs1.getString(2)%>"><%out.println(rs1.getString(4));%></a></td></tr>
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
<input type='submit' id="delb" value='delete'>
</div>
</form>
</body>
</html>