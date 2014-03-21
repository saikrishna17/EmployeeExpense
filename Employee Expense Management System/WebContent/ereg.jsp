<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.4.2.js"></script>
 <link rel="stylesheet" href="pr3.css" type="text/css" media="screen">
 <script type="text/javascript">
 function display()
 {
	 document.getElementById('tabpage_1').style.display = 'none';
		document.getElementById('tabpage_2').style.display = 'none';
		document.getElementById('tabpage_3').style.display = 'none';
		document.getElementById('tabpage_31').style.display = 'none';
		document.getElementById('tabpage_4').style.display = 'none';
		document.getElementById('tabHeader_1').setAttribute("class", "");
		document.getElementById('tabHeader_2').setAttribute("class", "");
		document.getElementById('tabHeader_3').setAttribute("class", "");
		document.getElementById('tabHeader_31').setAttribute("class", "");
		document.getElementById('tabHeader_4').setAttribute("class", "");	 
 }
function tab(tab) {
	document.getElementById('tabpage_1').style.display = 'none';
	document.getElementById('tabpage_2').style.display = 'none';
	document.getElementById('tabpage_3').style.display = 'none';
	document.getElementById('tabpage_31').style.display = 'none';
	document.getElementById('tabpage_4').style.display = 'none';
	document.getElementById('tabHeader_1').setAttribute("class", "");
	document.getElementById('tabHeader_2').setAttribute("class", "");
	document.getElementById('tabHeader_3').setAttribute("class", "");
    document.getElementById('tabHeader_31').setAttribute("class", "");
	document.getElementById('tabHeader_4').setAttribute("class", "");
	document.getElementById(tab).style.display = 'block';
    document.getElementById('tabHeader_'+tab).setAttribute("class", "active");
}
function validateForm(name1,name2,name3,name4,name6,name7,name8,name9,name10,name11,name12,name13,name14,name15,name16,name17)
{
    document.getElementById('tabpage_1').style.display = 'none';
	document.getElementById('tabpage_2').style.display = 'none';
	document.getElementById('tabpage_3').style.display = 'none';
	document.getElementById('tabpage_31').style.display = 'none';
	document.getElementById('tabpage_4').style.display = 'none';
	document.getElementById('tabHeader_1').setAttribute("class", "");
	document.getElementById('tabHeader_2').setAttribute("class", "");
	document.getElementById('tabHeader_3').setAttribute("class", "");
	document.getElementById('tabHeader_31').setAttribute("class", "");
	document.getElementById('tabHeader_4').setAttribute("class", "");
var a=document.forms["formElem"][name1].value;
var b=document.forms["formElem"][name2].value;
var c=document.forms["formElem"][name3].value;
var d=document.forms["formElem"][name4].value;
var f=document.forms["formElem"][name6].value;
var g=document.forms["formElem"][name7].value;
var h=document.forms["formElem"][name8].value;
var i=document.forms["formElem"][name9].value;
var j=document.forms["formElem"][name10].value;
var k=document.forms["formElem"][name11].value;
var l=document.forms["formElem"][name12].value;
var m=document.forms["formElem"][name13].value;
var m2=document.forms["formElem"][name13_2].value;
var n=document.forms["formElem"][name14].value;
var o=document.forms["formElem"][name15].value;
var p=document.forms["formElem"][name16].value;
var q=document.forms["formElem"][name17].value;
if (a==null || a=="" || b==null || b=="" || c==null || c=="" || d==null || d==""|| f==null || f=="")
{
	
	display();
	alert("Please enter all the feilds correctly");
document.getElementById('tabpage_1').style.display = 'block';
document.getElementById('tabHeader_1').style.backgroundColor="red";
return false;
}
else if((document.formElem.gender[0].checked == false)&& (document.formElem.gender[1].checked == false))
	{
	display();
	alert("Please enter all the feilds correctly");
	document.getElementById('tabpage_1').style.display = 'block';
	document.getElementById('tabHeader_1').style.backgroundColor="red";
	}
else if (g==null || g=="" || h==null || h=="" || i==null || i=="" || j==null || j==""|| k==null || k=="" || l==null || l=="")
{
	display();
	alert("Please enter all the feilds correctly");
document.getElementById('tabpage_2').style.display = 'block';
document.getElementById('tabHeader_2').style.backgroundColor="red";
return false;
}
else if (m==null || m=="" ||m2==null || m2=="" || n==null || n=="" )
{
	display();
	alert("Please enter all the feilds correctly");
document.getElementById('tabpage_3').style.display = 'block';
document.getElementById('tabHeader_3').style.backgroundColor="red";
return false;
}
else if (o==null || o=="" || p==null || p=="" || q==null || q=="")
{
	display();
	alert("Please enter all the feilds correctly");
document.getElementById('tabpage_4').style.display = 'block';
document.getElementById('tabHeader_4').style.backgroundColor="red";
return false;
}
return true;
}
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
else
{
%>
<%@ include file="empprofile.jsp" %>
<%} %>
        <div id="wrapper">
                <div id="steps">
                    <form id="formElem" name="formElem" action="empreg.jsp" method="post" onsubmit="return validateForm('fname','id','phone','dob','email','add','street','city','district','state','pin','dep','desg','super','user','pswrd','pswrdc')" > 
       
                        <fieldset class="step" id="tabpage_1" >
                            <legend>Personal Details</legend>
                            <p id="vali1">
                                <label for="fname">Full Name</label>
                                <input  type="text" id="fname" name="fname">
                            </p>
                            <p id="vali2">
                                <label for="id">Emp ID</label>
                                <input id="id" name="id" type="text" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali3">
                                <label for="phone">Phone</label>
                                <input id="phone" name="phone"  type="tel" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali4">
                                <label for="dob">DateOf Birth</label>
                                <input id="dob" name="dob" placeholder="e.g=10/12/2012" type="text" AUTOCOMPLETE=OFF />
                            </p>
							<p id="vali5">
							   <label for="gender">Gender</label>
							   Male<INPUT TYPE="radio" NAME="gender" value="male">Female<INPUT TYPE="radio" NAME="gender" value="female">
							</p>
							 <p id="vali6">
                                <label for="email">Email-ID</label>
                                <input id="email" name="email" type="text" AUTOCOMPLETE=OFF />
                            </p>
                         
                        </fieldset>
                        <fieldset class="step" id="tabpage_2" style="display: none;">
                            <legend>Address</legend>
                            <p id="vali7">
                                <label for="add">Block/Flat-No</label>
                               <input id="add" name="add" type="text" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali8">
                                <label for="street">Locality/Village</label>
                                <input id="street" name="street" type="text" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali9">
                                <label for="city">City/Taluk</label>
                                <input id="city" name="city" type="text" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali10">
                                <label for="district">District</label>
                                <input id="district" name="district" type="text" AUTOCOMPLETE=OFF />
                            </p>
							 <p id="vali11">
                                <label for="state">State</label>
                                <input id="state" name="state" type="text" AUTOCOMPLETE=OFF />
                            </p>
							 <p id="vali12">
                                <label for="pin">Pin Code</label>
                                <input id="pin" name="pin" type="text" AUTOCOMPLETE=OFF />
                            </p>
                        </fieldset>
						 <fieldset class="step" id="tabpage_3" style="display: none;">
                            <legend>Office Details</legend>
                            <p id="vali13">
                                <label for="dep">Department</label>
                                <input id="dep" name="dep" type="text" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali14">
                                <label for="desg">Designation</label>
                                <input id="desg" name="desg" type="text" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali14_2">
                                <label for="super">Supervisior</label>
                                <input id="super" name="super" type="text" AUTOCOMPLETE=OFF />
                            
                            </p>
                            <p id="vali14_3">
                                <label for="eamnt">Amount</label>
                                <input id="eamnt" name="eamnt" type="text" AUTOCOMPLETE=OFF />
                            </p>
                       <p id="vali14_4">
                                <label for="type">Emptype</label>
                           Manager <INPUT TYPE="radio" NAME="emp" value="manager">Employee<INPUT TYPE="radio" NAME="emp" value="employee">
                                
                            </p>
             <p id="vali14_5">
                                <label for="ans">Account Department</label>
                     Yes<INPUT TYPE="radio" NAME="ans" value="yes">No<INPUT TYPE="radio" NAME="ans" value="no">
                                
                            </p>
                        </fieldset>
                         <fieldset class="step" id="tabpage_31" style="display: none;">
                            <legend>Salary Details</legend>
                            <p id="vali13_1">
                                <label for="dep">Basic Pay</label>
                                <input id="pay" name="pay" type="text" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali13_2">
                                <label for="fare">Fare Allowance(%)</label>
                                <input id="fare" name="fare" type="text" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali13_3">
                                <label for="halt">Halting Allowance(%)</label>
                                <input id="halt" name="halt" type="text" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali13_4">
                                <label for="conv">Conveyance Allowance(%)</label>
                                <input id="conv" name="conv" type="text" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali13_5">
                                <label for="oa">Other Allowance(%)</label>
                                <input id="oa" name="oa" type="text" AUTOCOMPLETE=OFF />
                            </p>
                        </fieldset>
                        <fieldset class="step" id="tabpage_4" style="display:none;">
                         <legend>Login Details</legend>
                            <p id="vali15">
                                <label for="user">Username</label>
                                <input id="user" name="user" type="text" AUTOCOMPLETE=OFF />
                            </p>
                            <p id="vali16">
                                <label for="pswrd">Password</label>
                                <input id="pswrd" name="pswrd" type="password"AUTOCOMPLETE=OFF />
                            </p>
                             <p id="vali17">
                                <label for="pswrdc">Confirm Password</label>
                                <input id="pswrdc" name="pswrdc" type="password" AUTOCOMPLETE=OFF />
                            </p>
                         <p class="submit">
                                <button id="registerButton" type="submit">Register</button>
                            </p>
                        </fieldset>
                    </form>
                </div>
                <div id="navigation"  class="navigation" style="display">
                    <ul>
                        <li class="selected" id="tabHeader_1" onclick="tab('tabpage_1')">
                           Personal Details
                        </li>
                        <li id="tabHeader_2" onclick="tab('tabpage_2')">
                            Address
                        </li>
                        <li id="tabHeader_3" onclick="tab('tabpage_3')">
                            Office Details
                        </li>
                        <li id="tabHeader_31" onclick="tab('tabpage_31')">
                            Salary Details
                        </li>
                        <li id="tabHeader_4" onclick="tab('tabpage_4')">
                           Login Details
                        </li>
                    </ul>
                </div>
                 </div>  
</body>
</html>