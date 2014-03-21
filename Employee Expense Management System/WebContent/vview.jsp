<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="pr3.css" type="text/css" media="screen">
</head>
<body>
<div class='phead'></div>
<%@page import="java.sql.*"%>
<% 
try{
	 response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);

	  if(session.getAttribute("id")==null)
	      response.sendRedirect("index.jsp");
	ResultSet rs,rs2,rs3,rs4,rs5,rs6,rs61,rs7,rs8;
	Statement st,st2,st3,st4,st5,st6,st61,st7,st8;
	String vid=request.getParameter("id");
	session.setAttribute("voucherid",vid);
	String sender=request.getParameter("sender");
	session.setAttribute("senderemp",sender);
	String id=(String)session.getAttribute("id");
	String comp=(String)session.getAttribute("comp");
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
   st6=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);  
	           rs6=st6.executeQuery("select * from empdet where id='"+sender+"'");
	           rs6.first();%>
	           <div class='vdiv'><p class='vpar'>From:<%out.println(rs6.getString(2));%>(<%=rs6.getString(3)%>)
	           <br>Voucher ID:<%=vid%></p><br><TABLE class='vtable'>
	           
	          <%
	          st61=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);  
	           rs61=st61.executeQuery("select * from salary where id='"+sender+"'");
	           rs61.next();
	           int sal=Integer.parseInt(rs61.getString(2));
	           int fare=Integer.parseInt(rs61.getString(3));
	           int halt=Integer.parseInt(rs61.getString(4));
	           int conv=Integer.parseInt(rs61.getString(5));
	           int other=Integer.parseInt(rs61.getString(6));
	           int fa=(sal*fare)/100;
	        	int ha=(sal*halt)/100;
	        	int co=(sal*conv)/100;
	        	int ot=(sal*other)/100;
	        	int vamount=0;
	          st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	          rs=st.executeQuery("select * from voucher where vid='"+vid+"'");
	          if(rs.isBeforeFirst())
	          {
	        	  rs.first();
        	   %>
        	    <tr><td>Date:</td><td><%out.println(rs.getString(5));%></td></tr>
           <tr><td>Places Visited:</td><td><%out.println(rs.getString(2));%></td></tr>
           <tr><td>Date Of Departure</td><td><%out.println(rs.getString(3));%></td></tr>
           <tr><td>Date Of Arrival</td><td><%out.println(rs.getString(4));%></td></tr>
           <tr><td><br></td><td></td></tr>
           <% 
        	   }%>
	      
	           <%
	           
	          
	        	 
	        	  st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
		           rs2=st2.executeQuery("select * from vfare where vid='"+vid+"'");
		           if(rs2.isBeforeFirst())
			          {
	        	  rs2.first();
	        	   %>
	           <tr><td class='vfont'>FARE CHARGES:</td><td></td></tr>
	           <tr><td>Travelling Date:</td><td><%out.println(rs2.getString(2));%></td></tr>
	           <tr><td>From:</td><td><%out.println(rs2.getString(3));%></td></tr>
	           <tr><td>To:</td><td><%out.println(rs2.getString(4));%></td></tr>
	           <tr><td>Mode Of Transport:</td><td><%out.println(rs2.getString(5));%></td></tr>
	           <tr><td>Class Of Travel:</td><td><%out.println(rs2.getString(6));%></td></tr>
	           <tr><td>Fare:</td><td><%int famnt=Integer.parseInt(rs2.getString(7));vamount=vamount+famnt;out.println(famnt); if(fa<famnt)out.println("<FONT SIZE='2' COLOR='red'>(Exceeding fare allowance by Rs"+(famnt-fa)+")</font>");%></td></tr>
	           <tr><td>Ticket No:</td><td><%out.println(rs2.getString(8));%></td></tr>
	           <tr><td><br></td><td></td></tr>
	           <% }%>
	           <%
	          
		       
		        	  st3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
			           rs3=st3.executeQuery("select * from vhalt where vid='"+vid+"'");
			           if(rs3.isBeforeFirst())
				          {
			           rs3.first();
	        	   %>
	           <tr><td class='vfont'>Halting Allowances:</td><td></td></tr>
	           <tr><td>Loading Charges:</td><td><%int loamnt=Integer.parseInt(rs3.getString(2));out.println(loamnt);%></td></tr>
	           <tr><td>Boarding Charges:</td><td><%;int boamnt=Integer.parseInt(rs3.getString(3));out.println(boamnt);int tothalt=loamnt+boamnt;vamount=vamount+tothalt;if(ha<tothalt)out.println("<FONT SIZE='2' COLOR='red'>(Total exceeding Halting allowance by Rs"+(tothalt-ha)+")</font>");%></td></tr>
	           <tr><td><br></td><td></td></tr>
	           <% }%>
	           <%
	        
		       
		        	 st4=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			           rs4=st4.executeQuery("select * from vcon where vid='"+vid+"'");
			           if(rs4.isBeforeFirst())
				          {
			           rs4.first();
	        	   %>
	           <tr><td class='vfont'>Conveyance Charges:</td><td></td></tr>
	           <tr><td>Residential Address</td><td><%out.println(rs4.getString(2));%></td></tr>
	           <tr><td>Date:</td><td><%out.println(rs4.getString(3));%></td></tr>
	           <tr><td>From:</td><td><%out.println(rs4.getString(4));%></td></tr>
	           <tr><td>To:</td><td><%out.println(rs4.getString(5));%></td></tr>
	           <tr><td>Aprx Distance</td><td><%out.println(rs4.getString(6));%></td></tr>
	           <tr><td>Mode Of Conveyance</td><td><%out.println(rs4.getString(7));%></td></tr>
	           <tr><td>Charges Paid:</td><td><%int camnt=Integer.parseInt(rs4.getString(8));vamount=vamount+camnt;out.println(camnt); if(co<camnt)out.println("<FONT SIZE='2' COLOR='red'>(Exceeding Conveyance allowance by Rs"+(camnt-co)+")</font>");%></td></tr>
               <tr><td>Remarks:</td><td><%out.println(rs4.getString(9));%></td></tr>
               <tr><td><br></td><td></td></tr>
               <% }%>
               <%
 	           
 	        	  st5=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
 	               rs5=st5.executeQuery("select * from vother where vid='"+vid+"'");
 	              if(rs5.isBeforeFirst())
 		          {
 	               rs5.first();
	        	   %>
               <tr><td class='vfont'>Other Expenses:</td><td></td></tr>
               <tr><td>Particulars:</td><td><%out.println(rs5.getString(2));%></td></tr>
               <tr><td>Amount:</td><td><%int oamnt=Integer.parseInt(rs5.getString(3));out.println(oamnt);vamount=vamount+oamnt; if(ot<oamnt)out.println("<FONT SIZE='2' COLOR='red'>(Exceeding Other allowance by Rs"+(oamnt-ot)+")</font>");%></td></tr>
               <tr><td>Remarks:</td><td><%out.println(rs5.getString(4));%></td></tr>
              <tr><td><br></td><td></td></tr>
              <%
              }
              %>

</TABLE></div>
<%
st7=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
rs7=st7.executeQuery("select * from empdet where id='"+id+"'");
rs7.first();
String name=rs7.getString(2);
int supsal=Integer.parseInt(rs7.getString(11));
st8=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
rs8=st8.executeQuery("select * from inbox where vid="+vid+" and toid='"+id+"'");
rs8.first();
String status=rs8.getString(6);
if(status.equals("check0"))
{
	   st8.executeUpdate("update inbox set status='check1' where vid='"+vid+"'");
	   st8.executeUpdate("insert into einbox(fromid,toid,title,content,status) values('"+id+"','"+sender+"','Voucher vid="+vid+"','Your voucher has been been checked by "+name+"and she will soon respond to it','check0')");
}
%>
<nav>
<p class='lout'><a href='logout.jsp'>Logout</a></p>
<ul>
<li class='drop'>
<a href=<%
String type=(String)session.getAttribute("type");
if(type.equals("admin"))
	out.println("'profile.jsp'");
else
	out.println("'profileman.jsp'");

%> class='hover'>Home</a>
</li>
<li class='drop'><a href='voucherfwd.jsp' class='hover'>FORWARD</a></li>
<%if(supsal>=vamount)
{
//out.println("<script>alert('Voucher cnt be approved');</script>");
%>
<li class='drop'>
<a href='voucherapp.jsp' class='hover'>APPROVE</a></li>
<li class='drop'><a href='disreason.jsp' class='hover'>DISAPPROVE</a></li>
<%
}
else
{
%>
<script type="text/javascript"> 
alert("Total voucher amount is beyound your amount scope"); 
</script> 
<%
}
con.close();
}
catch(Exception e)
{
    System.out.println(e);
}
%>
</ul></nav> 
<div class='pfoot'></div>
</body>
</html>