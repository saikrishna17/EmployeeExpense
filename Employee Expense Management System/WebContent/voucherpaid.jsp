<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function check2() {
	   var arrMarkMail = document.getElementsByName("arrayb");
	   for (var i = 0; i < arrMarkMail.length; i++) {
	      arrMarkMail[i].checked = true;
	}
}

</script>
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
<form action="paid.jsp" method="post">
<div class='esrchdiv'>
<TABLE class='esrch'>
<tr><th>Voucher ID</th><th>Approved By</th><th>Paid/Unpaid</th><th><input type="button" onclick="check2()" value="checkall"></th></tr>
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
	String comp=(String)session.getAttribute("comp");
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
	Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from approve where comp='"+comp+"'");
while(rs.next())
{
	%>
		           <tr><td><%String vid=rs.getString(1);out.println(vid);%></td><td><%out.println(rs.getString(2));%></td><td><%String status=rs.getString(3);out.println(status);%></td>
		           <%if(status.equals("unpaid")){%>
		           <td><INPUT TYPE="checkbox" name="arrayb" value=<%=vid%>></td>
		           <%}else{ %>
		           <td></td>
		           <%} %>
		           </tr>
	
	<%
}
}
catch(Exception e){
    System.out.println(e);
}
%>
</TABLE>
<input type='submit' id="delb" value='Mark paid'>
</div>
</form>
</body>
</html>