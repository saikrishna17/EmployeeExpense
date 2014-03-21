<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="checkuser.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="cache-control" content="no-cache">  
<meta http-equiv="pragma" content="no-cache">  
<meta http-equiv="expires" content="-1">  

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
</head>
<body>
<%@page import="java.sql.*"%>
<%
try
{
	  response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);

	  if(session.getAttribute("id")==null)
	      response.sendRedirect("index.jsp");
	  Class.forName("com.ibm.db2.jcc.DB2Driver");
	  Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
   Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	     String id=(String)session.getAttribute("id");
String vid=(String)session.getAttribute("voucherid");
Statement st3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
ResultSet rs3=st3.executeQuery("select * from empdet where id='"+id+"'");
rs3.next();
String name=rs3.getString(2);
String superv=rs3.getString(10);
String type=rs3.getString(12);
st3.executeUpdate("insert into vforward(vid,fromid,toid) values ("+vid+",'"+id+"','"+superv+"')");
st3.executeUpdate("delete from inbox where vid="+vid);
st3.executeUpdate("insert into einbox(fromid,toid,title,content,status) values('"+id+"','"+superv+"','Voucher vid="+vid+"Forwarded','Voucher of vid="+vid+" has been been forwarded by "+name+".\r\n.Please check the voucher and either approve or disapprove it.\r\nThe entire voucer has been forwarded to u.','check0')");
Statement st4=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
ResultSet rs4=st4.executeQuery("select * from voucher where vid="+vid+"");
rs4.next();
String sender=rs4.getString(5);
System.out.println(sender);
st4.executeUpdate("insert into einbox(fromid,toid,title,content,status) values('"+id+"','"+sender+"','Voucher vid="+vid+"Forwarded','Voucher of vid="+vid+" has been been forwarded by "+name+" to his Seniour Employee of id "+superv+".\r\n.You will be receiving messageS based on the status of your voucher as soon as possible.','check0')");
st4.executeUpdate("insert into inbox (vid,fromid,toid,title,status) values ("+vid+",'"+sender+"','"+superv+"','voucher id "+vid+"','check0')");         
String message="Voucher Forward successful." ;
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
<div class='pfoot'></div>
</body>
</html>