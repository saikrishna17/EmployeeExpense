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
try{
	String value=request.getParameter("dest");
RequestDispatcher requestDispatcher ; 
if(value.equals("save"))
{
	requestDispatcher = request.getRequestDispatcher("/vsave.jsp" ) ; requestDispatcher.forward( request, response ) ;
}
else
	requestDispatcher = request.getRequestDispatcher("/voucher.jsp" ) ; requestDispatcher.forward( request, response ) ;

}
 catch(Exception e){
	    System.out.println(e);
	}
%>
</body>
</html>