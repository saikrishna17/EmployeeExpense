<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	
<link href="sample.css" rel="stylesheet" type="text/css" media="screen" />
<link href="news.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript">
	function overlay() {
        	el = document.getElementById("overlay");
        	el.style.visibility = (el.style.visibility == "visible") ? "visible" : "visible";
        }
        function login(user,pass)
        {
        	 var a=document.forms["myForm"][user].value;
        	  var b=document.forms["myForm"][pass].value;
        	  if ((a==null || a=="") && (b==null || b==""))
        	  {
        	  alert("PLEASE FILL THE Username and password");
        					 return false;					
        }
        	  return true;
        }

</script>
	
</head>

<body>

<div id="logo">
		<h1><a href="#">
		<span id="pic">
			<img src="images/iclaim.jpg" width="150" height="85" border="0" >
		</span>
		<span>
			iClaim </a></h1>
		</span>
	</div>
	<hr />
	<!-- end #logo -->
	<div id="header">
		<div id="menu">
			<ul>
				<li><a href="index.jsp" class="first">Home</a></li>
				<li class="current_page_item"><a href="#">services</a></li>
				<li><a href="About.jsp" >About</a></li>
				<li><a href="" onclick='overlay()'>Login</a></li>
				<li><a href="compreg.html">Register</a></li>
				
			</ul>
		</div>
		<!-- end #menu -->
	</div>
	<!-- end #header -->
	<!-- end #header-wrapper -->
	
	
<div id="page">
		<div id="content">
		<b><font size="4" color="">OVERVIEW</font></b><br>
		<font size="3" color=""><i>IClaim is software as a service and were keenly aware that customer satisfaction is totally dependent on both software and service.  Lots of products look great in a demo, but implementation, deployment, use and modifications can be a nightmare. For us, outstanding service is just as important as great software. Hey, maybe we�re also service as a software!!!?<br>
		<b><font size="4" color="">Success</font></b><br>
       Implementations arent considered complete until your IClaim is built, integrated with your internal systems and in pilot with your users.</i>
      <FONT SIZE="5" COLOR="BLACK">
      <BR></BR> Cut Costs, Improve Compliance
and Speed Reimbursement<BR></BR>
in your Organization<BR></BR></FONT>
Whether you are new to expense management automation or you HAVve been doing it for years, there are always new ways that you can cut costs, improve compliance and speed reimbursement for your organization.  Through many years of working with organizations of all sizes, in all industries, and from around the globe, we’ve gathered best practices that we’d like to share with you for improving your organizations’ expense reporting process.

This white paper includes the 10 essential best practices to expense management success:<BR></BR>

1.Ask Permission Rather than Beg Forgiveness<BR></BR>
2.Build an Accountable Plan<BR></BR>
3.Initiate a Corporate Card Program<BR></BR>
4.Automate Policy Enforcement<BR></BR>
5.Clearly Document the Approval Process<BR></BR>
6.End Penny Wise and Pound Foolish Auditing Practices<BR></BR>
7.Help Employees Make Good Decisions<BR></BR>
8.Centralize the Travel Expense Process<BR></BR>
9.Go Green<BR></BR>
10.Leverage your Leverage<BR></BR>
 
		</font>
		</div>
		<!-- end #content -->
		
		
		<div id="sidebar">
			<ul>
				<li>

				</li>
			</ul>
		</div>
		
		
	
		<div style="clear: both;">&nbsp;</div>
	</div>
	
	<div id="footer">
		<p>Copyright (c) 2012 KMIT. All rights reserved. Design by <a href="">MSSS</a>.</p>
	</div>
	<!-- end #footer -->	
</body>
</html>