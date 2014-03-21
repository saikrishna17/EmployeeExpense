<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
</script>

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
Integer maxv=(Integer)session.getAttribute("ivalue");
            	for(i=0;i<array.length;i++)
            	{
                if(array[i] != null)
                {    
                	st.executeUpdate("delete from inbox where toid='"+array[i]+"'");
                	st.executeUpdate("delete from inbox where fromid='"+array[i]+"'");
                	st.executeUpdate("delete from einbox where fromid='"+array[i]+"'");
                	st.executeUpdate("delete from einbox where toid='"+array[i]+"'");
                	st.executeUpdate("delete from eadd where id='"+array[i]+"'");
                    st.executeUpdate("delete from login where id='"+array[i]+"'");
                   st.executeUpdate("delete from empdet where id='"+array[i]+"'");
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