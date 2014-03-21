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
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.List,java.util.ArrayList,java.util.Iterator"%>

<%
try{
	String si=null;
	String str1=request.getParameter("fname");
    String str2=request.getParameter("id");
    String str3=request.getParameter("phone");
    String str4=request.getParameter("dob");
    String str5=request.getParameter("gender");
    String str6=request.getParameter("email");
    String str7=request.getParameter("add");
    String str8=request.getParameter("street");
    String str9=request.getParameter("city");
    String str10=request.getParameter("district");
    String str11=request.getParameter("state");
    String str12=request.getParameter("pin");
    String str13=request.getParameter("dep");
    String str14=request.getParameter("desg");
    String str14_2=request.getParameter("super");
    String str14_3=request.getParameter("eamnt");
    String str14_4=request.getParameter("emp");
    String str14_5=request.getParameter("ans");
    String str15=request.getParameter("user");
    String str16=request.getParameter("pswrdc");
    String str16_1=request.getParameter("pay");
    String str18=request.getParameter("fare");
    String str19=request.getParameter("halt");
    String str20=request.getParameter("conv");
    String str21=request.getParameter("oa");

    int a=Integer.parseInt(str3);
    int b=Integer.parseInt(str12);
    int c=0;
    if(str14_3!="")
    {
    c=Integer.parseInt(str14_3);
    }
    int d=Integer.parseInt(str16_1);
    int e=Integer.parseInt(str18);
    int f=Integer.parseInt(str19);
    int g=Integer.parseInt(str20);
    int h=Integer.parseInt(str21);
    String str17=(String)session.getAttribute("id");
    Class.forName("com.ibm.db2.jcc.DB2Driver");
    Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
           Statement st=con.createStatement(); 
           ResultSet rs=st.executeQuery("select * from empdet where id='"+str17+"'");
        	while(rs.next())
        	{
           si=rs.getString(1);
        	}
            st.executeUpdate("insert into empdet values ('"+si+"','"+str1+"','"+str2+"',"+a+",'"+str4+"','"+str5+"','"+str6+"','"+str13+"','"+str14+"','"+str14_2+"',"+b+",'"+str14_4+"','"+str14_5+"')");
           st.executeUpdate("insert into eadd values ('"+str2+"','"+str7+"','"+str8+"','"+str9+"','"+str10+"','"+str11+"',"+b+")");
           st.executeUpdate("insert into login values ('"+str2+"','"+str15+"','"+str16+"','"+str14_4+"')");
           st.executeUpdate("insert into salary values ('"+str2+"',"+d+","+e+","+f+","+g+","+h+")");
           String message="Employee successfully registered." ;
           response.sendRedirect("profile.jsp?success="+message);
           String host="", user="", pass="";
           host = "smtp.gmail.com"; //"smtp.gmail.com"; 
           user = "iclaim.msss@gmail.com"; //"YourEmailId@gmail.com" // email id to send the emails
           pass = "iclaim.msss@"; //Your gmail password
           String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
           String to = str6; // out going email id
           String from = "iclaim.msss@gmail.com"; //Email id of the recipient
           String subject = "Iclaim registered";
           String messageText = "You are registered in iclaim.Your username is "+str15+".Your password is "+str16+".";
           boolean sessionDebug = true;
           Properties props = System.getProperties();
           props.put("mail.host", host);
           props.put("mail.transport.protocol.", "smtp");
           props.put("mail.smtp.auth", "true");
           props.put("mail.smtp.", "true");
           props.put("mail.smtp.port", "465");
           props.put("mail.smtp.socketFactory.fallback", "false");
           props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
           Session mailSession = Session.getDefaultInstance(props, null);
           mailSession.setDebug(sessionDebug);
           Message msg = new MimeMessage(mailSession);
           msg.setFrom(new InternetAddress(from));
           InternetAddress[] address = {new InternetAddress(to)};
           msg.setRecipients(Message.RecipientType.TO, address);
           msg.setSubject(subject);
           msg.setContent(messageText, "text/html"); // use setText if you want to send text
           Transport transport = mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           try {
           transport.sendMessage(msg, msg.getAllRecipients());
           out.println("Email sent"); // assume it was sent
           }
           catch (Exception err) {
           System.out.println(err); // assume it's a fail
           }
           transport.close();
          
           con.close();	        
}
    catch(Exception e){
    System.out.println(e);
}
%>
</body>
</html>