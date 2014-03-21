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
try
{
String str1=request.getParameter("str1");
String str2=(String)session.getAttribute("empuse");
String str3=request.getParameter("str3");
String str4=request.getParameter("str4");
String str5=request.getParameter("str5");
String str6=request.getParameter("str6");
String str7=request.getParameter("str7");
String str8=request.getParameter("str8");
String str81=request.getParameter("str81");
String str82=request.getParameter("str82");
String str83=request.getParameter("str83");
String str84=request.getParameter("str84");
String str9=request.getParameter("str9");
String str10=request.getParameter("str10");
String str11=request.getParameter("str11");
String str12=request.getParameter("str12");
String str13=request.getParameter("str13");
String str14=request.getParameter("str14");
String str15=request.getParameter("str15");
String str16=request.getParameter("str16");
String str17=request.getParameter("str17");
String str18=request.getParameter("str18");
String str19=request.getParameter("str19");
//int a=Integer.parseInt(str3);
int b=Integer.parseInt(str14);
int c=Integer.parseInt(str82);
int d=Integer.parseInt(str15);
int e=Integer.parseInt(str16);
int f=Integer.parseInt(str17);
int g=Integer.parseInt(str18);
int h=Integer.parseInt(str19);
Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
       Statement st1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
       Statement st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
       st1.executeUpdate("UPDATE empdet SET name='"+str1+"',phone='"+str3+"',dob='"+str4+"',gen='"+str5+"',email='"+str6+"',dep='"+str7+"',desg='"+str8+"',superv='"+str81+"',amount="+c+",emptype='"+str83+"',account='"+str84+"' where id='"+str2+"'");
       st2.executeUpdate("UPDATE eadd SET block='"+str9+"',locality='"+str10+"',city='"+str11+"',dist='"+str12+"',state='"+str13+"',pin="+b+" where id='"+str2+"'");
       st2.executeUpdate("UPDATE salary SET sal="+d+",fa="+e+",ha="+f+",ca='"+g+"',oa="+h+" where id='"+str2+"'");
       String message="Employee details changed successfully.";
       response.sendRedirect("profile.jsp?success="+message);
       con.close();	        
   }
       catch(Exception e){
       System.out.println(e);
   }
%>
</body>
</html>