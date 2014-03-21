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
	int  flag=0;
	
	String a,b,c,d,message;
	session.setAttribute("name",null);
    session.setAttribute("id",null);
String user=request.getParameter("username");
String pass=request.getParameter("pswrd");
session.setAttribute("username",user);
Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
          Statement st=con.createStatement();
           Statement st2=con.createStatement();
           ResultSet rs=st.executeQuery("select * from login");
           while(rs.next())
	        {
	        	a=rs.getString(1);
	        	b=rs.getString(2);
	        	c=rs.getString(3);
	        	d=rs.getString(4);
	        if(user.equals(b)&& pass.equals(c))	
	        {
	        	flag=1;
	        	session.setAttribute("name",b);
	            session.setAttribute("id",a);
	            System.out.println(a);
	            session.setAttribute("type",d);
	        	if(d.equals("employee"))
	        	{
	        		out.println("<script>parent.location.href='empprofile.jsp'</script>");
		        	break;
	        	}
	        	else if(d.equals("admin"))
	        	{
	      		
	      		out.println("<script>parent.location.href='profile.jsp'</script>");
	        	break;
	        	}
	        	else
	        	{
		      		
	        		out.println("<script>parent.location.href='profileman.jsp'</script>");
		        	break;
		        	}
	        }	
	   
	        else if(user.equals(b))
	        {
	        message="Incorrect password";
	        response.sendRedirect("index.jsp?error="+message);
	        break;
	        }
	        }
	      if(flag==0)
	      {
	        message="Incorrect UserName and Password" ;
	        response.sendRedirect("index.jsp?error="+message);
	      } 
	       
           con.close();	
        }
    catch(Exception e){
    System.out.println(e);
}
%>
</body>
</html>