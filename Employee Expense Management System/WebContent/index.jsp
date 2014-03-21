<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="engine1/style1.css" />
	<script type="text/javascript" src="engine1/jquery.js"></script>
	
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="sample.css" rel="stylesheet" type="text/css" media="screen" />
<link href="news.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript">
        var imgs = [
        'images/emp.jpg',
        'images/icl.jpg',
        'images/images.jpg'];
        var cnt = imgs.length;

        $(function() {
            setInterval(Slider, 3000);
        });

        function Slider() {
        $('#sliding').fadeOut("slow", function() {
           $(this).attr('src', imgs[(imgs.length++) % cnt]).fadeIn("slow");
        });
        }
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




	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="engine1/style1.css" />
	<script type="text/javascript" src="engine1/jquery.js"></script>
	
</head>



<body style="background-color:#d7d7d7">
<%
String error=request.getParameter("error");
if(error==null || error=="null")
{
 error="";
}
%>


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
				<li><a href="#" class="first">Home</a></li>
				<li class="Services.html"><a href="Services.html">services</a></li>
				<li><a href="About.html">About</a></li>
				<li><a href="#" onclick='overlay()'>Login</a></li>
				<li><a href="compreg.html">Register</a></li>
				
			</ul>
		</div>
		<!-- end #menu -->
	</div>
	<center><div class="err"><p><font size="6" color="black"><%=error%></font></p></div></center>
	<!-- end #header -->
	<!-- end #header-wrapper -->
	<div id="overlay">
     <div>
     <p><a href="index.jsp">[close]</a></p>
       <form name="myForm" method="post" action="login2.jsp" onsubmit="return login('username','pswrd')">
		<table>
		<tr>
		<td><p><b><i><font size="7" color="white">Login</font></i></b></p></td>
		<td><IMG SRC="images/login.png" WIDTH="80" HEIGHT="80" BORDER="0" ALT=""></td>
		</tr>
	<tr><td><BR></td><td></td></tr>
		<TR>
			<TD><FONT SIZE="5" COLOR="white">Username :</font></td>
			<td><INPUT TYPE="text" NAME="username" input style="height:30px;font-size:14pt;"></td>
		</TR>
<TR>
<tr><td><BR></td><td></td></tr>
	<TD><FONT SIZE="5" COLOR="white">Password :</font></td>
		<td><INPUT TYPE="password"  NAME="pswrd" input style="height:30px;font-size:14pt;"></td>
		</TR>
		<tr><td><BR></td><td></td></tr>
		<tr><td></td><td><INPUT TYPE="submit" value="Sign In"input style=" width:90px;height:50px;font-size:12pt;" ></td>
		</tr>
		</TABLE>
       </FORM>
	 </div>
</div>
	
	<div id="wowslider-container1">
	<div class="ws_images"><ul>
<li><img src="data1/images/9.jpg" alt="Highly Configurable Expense Report Software" title="Highly Configurable Expense Report Software" id="wows1_0"/></li>
<li><img src="data1/images/10.jpg" alt="10" title="10" id="wows1_1"/></li>
<li><img src="data1/images/11.jpg" alt="11" title="11" id="wows1_2"/></li>
<li><img src="data1/images/13.jpg" alt="13" title="13" id="wows1_3"/></li>
<li><img src="data1/images/14.jpg" alt="14" title="14" id="wows1_4"/></li>
</ul></div>
<div class="ws_bullets"><div>
<a href="#" title="Highly Configurable Expense Report Software"><img src="data1/tooltips/9.jpg" alt="Highly Configurable Expense Report Software"/>1</a>
<a href="#" title="10"><img src="data1/tooltips/10.jpg" alt="10"/>2</a>
<a href="#" title="11"><img src="data1/tooltips/11.jpg" alt="11"/>3</a>
<a href="#" title="13"><img src="data1/tooltips/13.jpg" alt="13"/>4</a>
<a href="#" title="14"><img src="data1/tooltips/14.jpg" alt="14"/>5</a>
</div></div>

	</div>
	<script type="text/javascript" src="engine1/wowslider.js"></script>
	<script type="text/javascript" src="engine1/script.js"></script>
	
	
	<div id="page">
		<div id="content">
		  <div class="post">
				<h2 class="title"><a href="#">Welcome to iClaim</a></h2>
				<div class="entry">
					<p><strong>"After purchasing, employee expense claims are an organisation's biggest unmanaged cost. According to the Aberdeen Group, "Organisations that automate their expense claim process reduce out-of-policy expenses by 40% and reduce reimbursement cycle times by two thirds."</strong>
					<p><strong>iClaim-Intelligent Claim Solutions</strong>, cutting-edge technology provides businesses one application to more efficiently manage employee expenses.
					iClaim is one of the leading online expense management solutions in the Travel and Entertainment (T&E) industry.
					So quit fussing with paper expense reports and piles of receipts. Contact  iClaim Expense Management today!
					 </p>				 					
			</div>
		  </div>
		  
			<div class="post">
				<h2 class="title"><a href="#">Main Agenda</a></h2>
				<p class="meta"><em>We plan your AGENDA !</em></p>
				<div class="entry">
				<!--info entry -->
					<img src="images/mainag.jpg"  style="margin-left:50px" width="352px" height="143px" align="right">
					<p>Welcome to the place where you can actually tally the services given by you to the company in a course of time
									regarding the visits to other places etc...ICLAIM  makes expense management effortless and 
									provides valuable insight that can help save your business money.</p>
			</div>
			</div>
			
			
			
			<div class="post">
				<h2 class="title"><a href="#">News & Articles</a></h2>
				<p class="meta"><em>News from anywhere,we get it to you !</em></p>
				<div class="entry">
					<p>You have entered the primary source of information exchange in the world that is the NEWSPAPERS and ARTICLES !!the main part of this
					page is  the way we present the	project in the main arena !!</p>
				</div>
			</div>
			
			
			
			
			<div class="post">
				<h2 class="title"><a href="#">Powerful Features</a></h2>
				<p class="meta"><em>Empowerment with iClaim</em></p>
				<div class="entry">
				<img src="images/power.jpg"  style="margin-left:50px" width="305px" height="165px" align="right">
					<p> The power of any individual or any firm lies in the way they organize their mistakes to put them into a better way provider for the 
					public...this is the POWERFUL section of the SITE where in we deal with the POWERFUL FEATURES of the publishing site !!!</p>
			  </div>
			 </div>
			<div class="post">
				<h2 class="title"><a href="#">Clients Say !!!</a></h2>
				
				
				<div id="clients">
					
				</div>
				
				
				<p class="meta"><em><a href="#"></a></em></p>
			</div>
		</div>
		<!-- end #content -->
		
		
		<div id="sidebar">
			<ul>
				<li>

				</li>
			</ul>
		</div>
		
		
		
		<!-- client say start-->
		
		
		<div id="subOurClientContainer">
		<div class="testimonialContainer">
			<h4>VANITHA NARAYAN</h4>
			<h5>
                    CEO,INDIA<br>
                    IBM</h5>
			<img src="images/5-stars.jpg" alt="5-stars" width="71" height="11">
			<p>
                    iClaim has revolutionised the way we handle our expense claims. We are now
                    more efficient, timely and our work flow more streamlined. Access to data is easy
                    and the software is very intuitive and easy to use.
			</p>
		</div>
		
		<div class="testimonialContainer">
			<h4>BILL GATES</h4>
			<h5>
                    CEO,<br>
                    MICROSOFT</h5>
			<img src="images/5-stars.jpg" alt="5-stars" width="71" height="11">
			<p>
                    iClaim has been a really great way to save time and money for our company.
                    Our employees really enjoy using this Expense Reporting Solution.
			</p>
		</div>
		
		<div class="testimonialContainer">
			<h4>STEVE JOBS</h4>
			<h5>
                    Former CEO,
			   <br>
                   APPLE inc.
			   </h5>
			<img src="images/5-stars.jpg" alt="5-stars" width="71" height="11">
			<p>
                   If you are looking for an excellent online expense management system, your search
                    can now stop. iClaim is hands down the best system out there.
			</p>
		</div>
		</div>

		

	<!-- client say end-->
	
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end #page -->
	<div id="footer">
		<p>Copyright (c) 2012 KMIT. All rights reserved. Design by <a href="">MSSS</a>.</p>
	</div>
	<!-- end #footer -->
	
	
	
</body>
</html>