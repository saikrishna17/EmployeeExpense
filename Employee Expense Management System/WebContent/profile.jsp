<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="cache-control" content="no-cache">  
<meta http-equiv="pragma" content="no-cache">  
<meta http-equiv="expires" content="-1">  

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script src="js/jquery.autocomplete.js"></script>	
<script type="text/javascript">
function searchcheck()
{
	if(document.formSearch.search.value=="")
		{
		alert("Fill the details related to your search");
		document.formSearch.search.focus();
		return false;
		}
	return true;
	}
	
jQuery(function(){
	$("#forms").autocomplete("list.jsp");
});
</script>
 <link rel="stylesheet" href="pr3.css" type="text/css" media="screen">
</head>
</head>
<body>
<%
String success=request.getParameter("success");
if(success==null || success=="null")
{
 success="";
}
%>
<div class='phead'></div>
<div class="logo">
			<img src="images/iclaim.jpg" width="140" height="65" border="0" >
			</div>

<nav>
<p class='lout'><a href='logout.jsp'>Logout</a></p>
<ul>
<li class='drop'><a href='profile.jsp'>Home</a></li>
<li class='drop'>
<a href='#' class='hover'>Employee</a>
<div class='dropdownContain'>
<div class='dropOut'>
<div class='triangle'></div>
<ul>
<li><a href='ereg.jsp' class='ihover'>Add</a></li>
</ul></div></div></li>
<li class='drop'><a href='#' class='hover'>Voucher</a>
<div class='dropdownContain'>
<div class='dropOut'>
<div class='triangle'></div>
<ul><li><a href='forms.jsp' >Create New</a></li>
</ul></div></div></li></ul></nav>
<div class='search'>
<form id="formSearch" name="formSearch" action="empsearch.jsp" onsubmit="return searchcheck()" method="post">
<input type="text" id="forms" name="forms" class="input_text"/>
<button id="registerButton" type="submit">Search</button></form>
</div>
<div class='aside'>
<div class='navbox'><ul class='navi'>
<li><a href='einbox.jsp'>Inbox 
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
 
String id=(String)session.getAttribute("id");	
System.out.println("seju");
int num=0;
Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
       Statement st=con.createStatement(); 
       ResultSet rs=st.executeQuery("select * from einbox where toid='"+id+"'");
       while(rs.next())
       {
    	   //String status=rs.getString(5);
    	   //String check="check0";
    	if(rs.getString(6).equals("check0"))
       {
    	num++;
       }
       }
       out.println("("+num+")");
%>
</a></li>
<li><a href='inbox.jsp'>Vouchers
<%
num=0;
Statement st2=con.createStatement(); 
ResultSet rs2=st2.executeQuery("select * from inbox where toid='"+id+"'");
while(rs2.next())
{
	   //String status=rs.getString(5);
	   //String check="check0";
	if(rs2.getString(6).equals("check0"))
{
	num++;
}
}
out.println("("+num+")");
Statement st3=con.createStatement(); 
ResultSet rs3=st3.executeQuery("select * from empdet where id='"+id+"'");
rs3.next();
String company=rs3.getString(1);
String acnt=rs3.getString(13);
session.setAttribute("comp",company);
%>
</a></li>
<li><a href='draft.jsp'>Drafts</a></li>
<%if(acnt.equals("yes")){ %>
<li><a href='voucherpaid.jsp'>Voucher Paid</a></li>
<%} 
con.close();
}
catch(Exception e)
{
   System.out.println(e);
}%>
<li><a href='vouchersent.jsp'>Voucher Sent</a></li>
<li><a href='voucherap.jsp'>Voucher Approved</a></li>
<li><a href='voucherd.jsp'>Voucher Disapproved</a></li>
</ul></div></div>
<div class="success"><%=success%></div>
<div class='pfoot'></div>
</body>
</html>