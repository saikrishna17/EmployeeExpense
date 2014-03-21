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
try{
	 response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);

	  if(session.getAttribute("id")==null)
	      response.sendRedirect("index.jsp");
	  String pdate=request.getParameter("pdate");
	 String places=request.getParameter("places");
    String dod=request.getParameter("dod");
    String doa=request.getParameter("doa");
     String tdate =request.getParameter("tdate");
    String tfrom=request.getParameter("tfrom");
    String tto=request.getParameter("tto");
    String mode=request.getParameter("mode");
    String classveh=request.getParameter("classveh");
    String farest=request.getParameter("fares");
    String tickno=request.getParameter("tickno");
    
    String lchargest=request.getParameter("lcharge");
    String bchargest=request.getParameter("bcharge");
    
    String radd=request.getParameter("radd");
    String cdate=request.getParameter("cdate");
    String cfrom =request.getParameter("cfrom");
    String cto=request.getParameter("cto");
    String appdistst=request.getParameter("appdist");
    String cmode=request.getParameter("cmode");
    String cpaidst=request.getParameter("cpaid");
    String rem=request.getParameter("rem");
    
    String part=request.getParameter("part");
    String amnt=request.getParameter("amnt");
    String reme=request.getParameter("reme");
    String vfare=request.getParameter("fare");
	
    String vhalt=request.getParameter("halt");
	
    String vconv=request.getParameter("conv");
	
    String vother=request.getParameter("other");
	
    Statement st,st2,st3;
    int fare=0;
    int lcharge=0;
    int bcharge=0;
    int appdist=0;
    int cpaid=0;
    int amount=0;
    if(farest!=null){
    	if(!farest.equals(""))
    fare=Integer.parseInt(farest);
    }
    if(lchargest!=null){
    if(!lchargest.equals(""))
    {
    lcharge=Integer.parseInt(lchargest);
    }
    }
    if(bchargest!=null){
    if(!bchargest.equals(""))
    {
    bcharge=Integer.parseInt(bchargest);
    }
    }
    if(appdistst!=null)
    {
    if(!appdistst.equals(""))
    {
    appdist=Integer.parseInt(appdistst);
    }
    }
    if(cpaidst!=null){
    if(!cpaidst.equals(""))
    {
    cpaid=Integer.parseInt(cpaidst);
    }
    }
    if(amnt!=null){
    	
    if(!amnt.equals(""))
    {
    amount=Integer.parseInt(amnt);
    } 
    }
    
    String id=(String)session.getAttribute("id");
    String toid;
    ResultSet rs,rs2,rs3;
    int count=0;
    Class.forName("com.ibm.db2.jcc.DB2Driver");
    Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
    System.out.println("hello1");
           st=con.createStatement();
          // System.out.println("hello2");
           st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           //System.out.println("hello5");
           st3=con.createStatement();
           //System.out.println("hello6");
           rs3=st3.executeQuery("select * from empdet where id='"+id+"'");
rs3.next();
String company=rs3.getString(1);          
           st.executeUpdate("insert into voucher(pvis,dod,doa,sender,pdate,comp) values ('"+places+"','"+dod+"','"+doa+"','"+id+"','"+pdate+"','"+company+"')");  System.out.println("hello4");
           rs=st.executeQuery("select max(vid) from voucher");
           if(rs!=null)
           {
        	   rs.next();
           count=Integer.parseInt( rs.getString(1));
           
           }
           if(vfare != null)
           st.executeUpdate("insert into vfare values ("+count+",'"+tdate+"','"+tfrom+"','"+tto+"','"+mode+"','"+classveh+"',"+fare+",'"+tickno+"')");
           if(vhalt != null)
           {
        	   System.out.println("hello13");
           
           st.executeUpdate("insert into vhalt values ("+count+","+lcharge+","+bcharge+")");
           }
           
           if(vconv != null)
           st.executeUpdate("insert into vcon values ("+count+",'"+radd+"','"+cdate+"','"+cfrom+"','"+cto+"',"+appdist+",'"+cmode+"',"+cpaid+",'"+rem+"')");
           if(vother != null)
           st.executeUpdate("insert into vother values ("+count+",'"+part+"',"+amount+",'"+reme+"')");
           
           rs2=st2.executeQuery("select superv,emptype from empdet where id='"+id+"'");
	       System.out.println("he1");
           rs2.first();
           System.out.println("he2");
	       toid=rs2.getString(1);
	       String type=rs2.getString(2);
	       System.out.println("he3");
	       st2.executeUpdate("insert into inbox (vid,fromid,toid,title,status) values ("+count+",'"+id+"','"+toid+"','voucher id "+count+"','check0')");         
	       String message="Voucher successfully sent to your supervisor." ;
	       if(type.equals("admin"))
	        response.sendRedirect("profile.jsp?success="+message);
	       else if(type.equals("employee"))
		        response.sendRedirect("empprofile.jsp?success="+message);
		         else
	       	   response.sendRedirect("profileman.jsp?success="+message);
	       con.close();	
}
    catch(Exception e){
    System.out.println(e);
}
%>

</body>
</html>