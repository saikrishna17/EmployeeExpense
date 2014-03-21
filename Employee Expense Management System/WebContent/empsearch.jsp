<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.4.2.js"></script>
<script type="text/javascript">
function check2() {
	   var arrMarkMail = document.getElementsByName("arrayb");
	   for (var i = 0; i < arrMarkMail.length; i++) {
	      arrMarkMail[i].checked = true;
	}
}
</script>
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
	session.setAttribute("ivalue",null);
	session.setAttribute("ivalue1",null);
	String eid=null;
	String ename=null;
	String email=null;
	String str1=request.getParameter("forms");
	 String str2=(String)session.getAttribute("id");
	 String stremail=(String)session.getAttribute("email");
	 Class.forName("com.ibm.db2.jcc.DB2Driver");
	 Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
	           Statement st=con.createStatement(); 
	           ResultSet rs=st.executeQuery("select * from empdet");
	           %>
	           <form  action="empdel.jsp">
	           <div class='esrchdiv'>
	           <TABLE class='esrch'>
 <TR>
	<TH>Id:</TH>
	<TH>Name:</TH>
	<th><input type="button" onclick="check2()" value="checkall"></th>
  </TR>
  <%
  int i=0;
  while(rs.next())
  {
	        	   if(str1.equals(rs.getString(2)) || str1.equals(rs.getString(3)))
	        	   {
	           email=rs.getString(1);
	           ename=rs.getString(2);
	           eid=rs.getString(3);
	           
	           if(eid.equals(str2) || !email.equals(stremail))
	           { 
	          continue;
	           }
%>
  <TR>
	<TD><a href="empview.jsp?id=<%=eid%>"><%out.println(eid);%></a></TD>
	<TD><a href="empview.jsp?id=<%=eid%>"><%out.println(ename);%></a></TD>
	<td><INPUT TYPE="checkbox" name="arrayb" value="<%=eid%>"></td>
  </TR>
  <%
	        	   }      	   
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
<input type='submit' id="delb" value='delete'>
</form>
<div class='pfoot'></div>
</body>
</html>