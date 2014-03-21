<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
  String choice = request.getParameter("dest");

  if(choice.equalsIgnoreCase("save")){
	  RequestDispatcher rd =   request.getRequestDispatcher("vsave.jsp");
	  rd.forward(request,response);
  }
  else if(choice.equalsIgnoreCase("submit"))
  {
	  RequestDispatcher rd =   request.getRequestDispatcher("voucher.jsp");  
	  rd.forward(request,response);
  }

%>

</body>
</html>