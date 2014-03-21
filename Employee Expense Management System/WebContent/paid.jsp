<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%
try{
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
          Statement st=con.createStatement(); 	           
int i;
String array[]=request.getParameterValues("arrayb");
            	for(i=0;i<array.length;i++)
            	{
                if(array[i] != null)
                {    
                	st.executeUpdate("update approve set paid='paid' where vid="+array[i]);
                }
            	}
            	String message="Employee deleted successfully" ;
        	        response.sendRedirect("profile.jsp?success="+message);
            	con.close();
}
catch(Exception e)
{
    System.out.println(e);
}

        %>
</body>
</html>