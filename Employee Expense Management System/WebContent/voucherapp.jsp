<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="checkuser.jsp" %>
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
	  response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);

	  if(session.getAttribute("id")==null)
	      response.sendRedirect("index.jsp");
 
	ResultSet rs;
	Statement st,st2;
	String id=(String)session.getAttribute("id");
	String vid=(String)session.getAttribute("voucherid");
	String sender=(String)session.getAttribute("senderemp");
	String comp=(String)session.getAttribute("comp");
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
    st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	    st.executeUpdate("insert into approve values ("+vid+",'"+id+"','unpaid','"+comp+"')");
	    rs=st.executeQuery("select * from empdet where id='"+id+"'");
	    System.out.println("he");
	    rs.first();
	    System.out.println("he0");
	    String name=rs.getString(2);
	    String type=rs.getString(12);
	    System.out.println("he1");
	    st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	    System.out.println("he2");
	    st2.executeUpdate("delete from inbox where vid="+vid);
	    System.out.println("he3");
	    st2.executeUpdate("insert into einbox(fromid,toid,title,content,status) values('"+id+"','"+sender+"','Voucher vid="+vid+" approved','Your voucher has been been approved by "+name+"','check0')");
	   String message="Voucher successfully approved." ;
	   if(type.equals("admin"))
        response.sendRedirect("profile.jsp?success="+message);
	   else
		   response.sendRedirect("profileman.jsp?success="+message);
	   con.close();
	    }
	    catch(Exception e)
	    {
	        System.out.println(e);
	    }
	    %>
</body>
</html>