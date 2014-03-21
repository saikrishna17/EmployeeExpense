<html>
<body>
<%
String unameee=(String)session.getAttribute("username");
if(unameee==null||unameee.equals(""))
{
	response.sendRedirect("index.jsp");
	return;
}
%>
</body>
</html>