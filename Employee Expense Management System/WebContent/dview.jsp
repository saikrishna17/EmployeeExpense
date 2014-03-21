<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="pr3.css" type="text/css" media="screen">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/form.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
</head>
<body>
<% 
String type=(String)session.getAttribute("type");
if(type.equals("admin"))
{
%>
<%@ include file="profile.jsp" %>
<%
}
else if(type.equals("manager"))	
{
%>
<%@ include file="profileman.jsp" %>
<%
}
else
{
%>
<%@ include file="empprofile.jsp" %>
<%} %>
  <div id="formation">
	   <form method="get" action="savesubmit.jsp" id="EmpExpForm">
			 <ul id="expForm">
			 
			 <%@page import="java.sql.*"%>
			 <%
			 try{
				 String vid=request.getParameter("id");
				  int voucherid=Integer.parseInt(vid);
				 ResultSet rs,rs2,rs3,rs4,rs5;
					Statement st,st2,st3,st4,st5;
				
					Class.forName("com.ibm.db2.jcc.DB2Driver");
					Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
    st=con.createStatement();
						st2=con.createStatement();
						st3=con.createStatement();
						st4=con.createStatement();
						st5=con.createStatement();
					    rs=st.executeQuery("select * from vdrafts where vid="+voucherid);
	rs.next();
			 %>
			 			 <li class="lbl">Date :</li><li class="inpt"><input name="pdate" type="text" value="<%out.println(rs.getString(2));%>">(yyyy-mm-dd)</li>
			 
			 <li class="lbl">Places visited :</li><li class="inpt"> <textarea name="places" id="palces" rows="5" cols="16" value="<%out.println(rs.getString(3));%>"></textarea></li>
			 <li class="lbl">Date of Departure :</li><li class="inpt"><input name="dod" type="text" value="<%out.println(rs.getString(4));%>">(yyyy-mm-dd)</li>
			 <li class="lbl">Date of Arrival :</li><li class="inpt"><input name="doa" type="text" value="<%out.println(rs.getString(5));%>">(yyyy-mm-dd)</li>
			 <li class="lbl"><h3>Purpose :</h3></li><br>
			 <%rs2=st2.executeQuery("select * from vfared where vid="+voucherid);
				rs2.next(); %>
			 <li class="lbl"></li><li class="inpt"><i><input id="check" type="checkbox" name="fare">fare charges </i></li>
			<div id="fareInpts" style="display:none">
			    <li class="lbl">Date :</li><li class="inpt"><input type="text" name="tdate" value="<%out.println(rs2.getString(2));%>"/></li>
				<li class="lbl">From :</li><li class="inpt"><input type="text" name="tfrom" value="<%out.println(rs2.getString(3));%>"/></li>
				<li class="lbl">To :</li><li class="inpt"><input type="text" name="tto" value="<%out.println(rs2.getString(4));%>"/></li>
				<li class="lbl">Mode Of Transport :</li><li class="inpt"><input type="text" name="mode" value="<%out.println(rs2.getString(5));%>"/></li>
				<li class="lbl">Class Of Travel	:</li><li class="inpt"><input type="text" name="classveh" value="<%out.println(rs2.getString(6));%>"/></li>
				<li class="lbl">Fare :</li><li class="inpt"><input type="text" name="fares" value="<%out.println(rs2.getString(7));%>" /></li>
				<li class="lbl">Ticket No :</li><li class="inpt"><input type="text" name="tickno" value="<%out.println(rs2.getString(8));%>"/></li>
		    </div>
		    <%
		    rs3=st3.executeQuery("select * from vhaltd where vid="+voucherid);
			rs3.next();
		    %>
			<li class="lbl"><h3>Purpose :</h3></li><br>
			<li class="lbl"></li><li class="inpt"><i><input id="check1" type="checkbox" name="halt">Halting charges </i></li>
			<div id="haltInpts" style="display:none">
				<li class="lbl">Lodging Charges :</li><li class="inpt"><input type="text" name="lcharge" value="<%out.println(rs3.getString(2));%>"/></li>
				<li class="lbl">Boarding Charges :</li><li class="inpt"><input type="text" name="bcharge" value="<%out.println(rs3.getString(3));%>"/></li>
			</div>
			<%
		    rs4=st4.executeQuery("select * from vcond where vid="+voucherid);
			rs4.next();
		    %>
			<li class="lbl"><h3>Purpose :</h3></li><br>
			<li class="lbl"></li><li class="inpt"><i><input id="check2" type="checkbox" name="conv">conveyance charges </i></li>
			<div id="ccInpts" style="display:none">
				<li class="lbl">Residential Address :</li><li class="inpt"><input type="text" name="radd" value="<%out.println(rs4.getString(2));%>" /></li>
				<li class="lbl">Date :</li><li class="inpt"><input type="text" name="cdate" value="<%out.println(rs4.getString(3));%>"/></li>
				<li class="lbl">From :</li><li class="inpt"><input type="text" name="cfrom" value="<%out.println(rs4.getString(4));%>" /></li>
				<li class="lbl">To :</li><li class="inpt"><input type="text" name="cto" value="<%out.println(rs4.getString(5));%>"/></li>
				<li class="lbl">Approximate Distance :</li><li class="inpt"><input type="text" name="appdist" value="<%out.println(rs4.getString(6));%>"/></li>
				<li class="lbl">Mode Of Conveyance :</li><li class="inpt"><input type="text" name="cmode" value="<%out.println(rs4.getString(7));%>"/></li>
				<li class="lbl">Charges Paid :</li><li class="inpt"><input type="text" name="cpaid" value="<%out.println(rs4.getString(8));%>"/></li>
				<li class="lbl">Remarks :</li><li class="inpt"> <textarea name="rem" rows="5" cols="16" value="<%out.println(rs4.getString(9));%>"></textarea></li>
			</div>
			<%
		    rs5=st5.executeQuery("select * from votherd where vid="+voucherid);
			rs5.next();
		    %>
			<li class="lbl"><h3>Purpose :</h3></li><br>
			<li class="lbl"></li><li class="inpt"><i><input id="check3" type="checkbox" name="other">Other Expenses </i></li>
			<div id="otherInpts" style="display:none">
				<li class="lbl" >Particulars :</li><li class="inpt"> <textarea name="part" rows="5" cols="16" value="<%out.println(rs5.getString(2));%>"></textarea></li>
				<li class="lbl" >Amount :</li><li class="inpt"><input type="text" name="amnt" value="<%out.println(rs5.getString(3));%>"/></li>
				<li class="lbl" >Remarks :</li><li class="inpt"> <textarea name="reme" rows="5" cols="16" value="<%out.println(rs5.getString(4));con.close();} catch(Exception e){
			    System.out.println(e);
			 }    %>"></textarea></li>
			</div>
			<li class="lbl"><input type="submit" name="dest" value="submit" style="margin-left:450px"/></li>
		    <li class="lbl"><input type="submit" name="dest" value="save" style="margin-left:150px"/></li>
		    </ul>
	  </form>
   </div>
</body>
</html>

