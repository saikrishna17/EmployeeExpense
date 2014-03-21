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
<script type="text/javascript">
/*function on(a)
{
	alert("a: "+a);
	
	
	}*/
</script>
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
else if(type.equals("employee"))
{
%>
<%@ include file="empprofile.jsp" %>
<%} %>
  <div id="formation">
	   
	  <form method="post" id="EmpExpForm" action="savesubmit.jsp">
			 <ul id="expForm">
			 <li class="lbl">Date :</li><li class="inpt"><input name="pdate" type="text">(yyyy-mm-dd)</li>
			 <li class="lbl">Places visited :</li><li class="inpt"> <textarea name="places" id="palces" rows="5" cols="16" value=""></textarea></li>
			 <li class="lbl">Date of Departure :</li><li class="inpt"><input name="dod" type="text">(yyyy-mm-dd)</li>
			 <li class="lbl">Date of Arrival :</li><li class="inpt"><input name="doa" type="text" >(yyyy-mm-dd)</li>
			 <li class="lbl"><h3>Purpose :</h3></li><br>
			 <li class="lbl"></li><li class="inpt"><i><input id="check" type="checkbox" name="fare" value="fare">fare charges </i></li>
			<div id="fareInpts" style="display:none">
			    <li class="lbl">Date :</li><li class="inpt"><input type="text" name="tdate" /></li>
				<li class="lbl">From :</li><li class="inpt"><input type="text" name="tfrom" /></li>
				<li class="lbl">To :</li><li class="inpt"><input type="text" name="tto" /></li>
				<li class="lbl">Mode Of Transport :</li><li class="inpt"><input type="text" name="mode" /></li>
				<li class="lbl">Class Of Travel	:</li><li class="inpt"><input type="text" name="classveh" /></li>
				<li class="lbl">Fare :</li><li class="inpt"><input type="text" name="fares" /></li>
				<li class="lbl">Ticket No :</li><li class="inpt"><input type="text" name="tickno" /></li>
		    </div>
			<li class="lbl"><h3>Purpose :</h3></li><br>
			<li class="lbl"></li><li class="inpt"><i><input id="check1" type="checkbox" name="halt" value="halt">Halting charges </i></li>
			<div id="haltInpts" style="display:none">
				<li class="lbl">Lodging Charges :</li><li class="inpt"><input type="text" name="lcharge" /></li>
				<li class="lbl">Boarding Charges :</li><li class="inpt"><input type="text" name="bcharge"/></li>
			</div>
			<li class="lbl"><h3>Purpose :</h3></li><br>
			<li class="lbl"></li><li class="inpt"><i><input id="check2" type="checkbox" name="conv" value="conv">conveyance charges </i></li>
			<div id="ccInpts" style="display:none">
				<li class="lbl">Residential Address :</li><li class="inpt"><input type="text" name="radd" /></li>
				<li class="lbl">Date :</li><li class="inpt"><input type="text" name="cdate" /></li>
				<li class="lbl">From :</li><li class="inpt"><input type="text" name="cfrom" /></li>
				<li class="lbl">To :</li><li class="inpt"><input type="text" name="cto" /></li>
				<li class="lbl">Approximate Distance :</li><li class="inpt"><input type="text" name="appdist"/></li>
				<li class="lbl">Mode Of Conveyance :</li><li class="inpt"><input type="text" name="cmode" /></li>
				<li class="lbl">Charges Paid :</li><li class="inpt"><input type="text" name="cpaid" /></li>
				<li class="lbl">Remarks :</li><li class="inpt"> <textarea name="rem" rows="5" cols="16" ></textarea></li>
			</div>
			<li class="lbl"><h3>Purpose :</h3></li><br>
			<li class="lbl"></li><li class="inpt"><i><input id="check3" type="checkbox" name="other" value="other">Other Expenses </i></li>
			<div id="otherInpts" style="display:none">
				<li class="lbl" >Particulars :</li><li class="inpt"> <textarea name="part" rows="5" cols="16"></textarea></li>
				<li class="lbl" >Amount :</li><li class="inpt"><input type="text" name="amnt"/></li>
				<li class="lbl" >Remarks :</li><li class="inpt"> <textarea name="reme" rows="5" cols="16"></textarea></li>
			</div>
			
			<li class="lbl"><input type="submit" name="dest" value="submit" style="margin-left:450px"/></li>
			
		    <li class="lbl"><input type="submit" name="dest" value="save" style="margin-left:150px"/></li>
		    </ul>
	  </form>
   </div>
</body>
</html>