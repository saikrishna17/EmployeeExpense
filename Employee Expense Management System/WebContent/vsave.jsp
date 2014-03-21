<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*,java.text.*"%>
<%
try{
	System.out.println("vsave.jsp lo vacha");
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
    ResultSet rs,rs2;
    Statement st,st2;
    int count;
    String countst;
    int fare=0;
    int lcharge=0;
    int bcharge=0;
    int appdist=0;
    int cpaid=0;
    int amount=0;
    System.out.println("OKKKKK");
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
    System.out.println("It's alright now..");
    System.out.println(farest);
    System.out.println(lchargest);
    System.out.println(bchargest);
    System.out.println(appdistst);
    System.out.println(cpaidst);
    System.out.println(amnt);
    System.out.println("pdate="+pdate);
    
    
    String id=(String)session.getAttribute("id");
    Class.forName("com.ibm.db2.jcc.DB2Driver");
    Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
    if(con!=null){
    	System.out.println("Connection OK");
    }
    	   st=con.createStatement();
           st2=con.createStatement();
    
           rs=st.executeQuery("select max(vid) from vdrafts");
           if(rs==null)System.out.println("It is null yar..");
           System.out.println("vsave.jsp lo after rs");
           if(rs!=null)
           {
           //rs.first();
           System.out.println("vsave.jsp lo in rs if");
           rs.next();
           countst=rs.getString(1);
           System.out.println(countst);
           if(countst==null)
           {
        	   count=0;
           }
        	  else
        	  {
        	count=Integer.parseInt(countst);
        	  }
           System.out.println(count);
           count++;
           System.out.println(pdate+""+places+""+dod+""+doa+""+id);
           
           DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
           java.util.Date startDate = df.parse(pdate);
           java.sql.Date tdate1 = new java.sql.Date(startDate.getTime());
           String query = "insert into vdrafts(tdate,pvis,dod,doa,sender)values ('"+pdate+"','"+places+"','"+dod+"','"+doa+"','"+id+"')";
          // System.out.println("query: "+ query);
           st.executeUpdate(query);
          String query1="insert into vhaltd(vid,lcharges,vcharges) values ("+count+","+lcharge+","+bcharge+")";
           //System.out.println("query1: "+ query1);
          st.executeUpdate(query1);
          String query2="insert into vfared(vid,pdate,fromp,top,mot,class,fare,tno) values ("+count+",'"+tdate+"','"+tfrom+"','"+tto+"','"+mode+"','"+classveh+"',"+fare+",'"+tickno+"')";
           //st.executeUpdate("insert into vfared vinsert into vfared values ("+count+",'"+tdate+"','"+tfrom+"','"+tto+"','"+mode+"','"+classveh+"',"+fare+",'"+tickno+"')values ("+count+",'"+tdate+"','"+tfrom+"','"+tto+"','"+mode+"','"+classveh+"',"+fare+",'"+tickno+"')");
           st.executeUpdate(query2);
          //  st.executeUpdate("insert into vhaltd values ("+count+","+lcharge+","+bcharge+")");
            
           st.executeUpdate("insert into vcond values ("+count+",'"+radd+"','"+cdate+"','"+cfrom+"','"+cto+"',"+appdist+",'"+cmode+"',"+cpaid+",'"+rem+"')");
           //st.executeUpdate("insert into votherd values ("+count+",'"+part+"',"+amount+",'"+reme+"')");
            String message="Voucher saved" ;
            String type=(String)session.getAttribute("type");
     	   if(type.equals("admin"))
             response.sendRedirect("profile.jsp?success="+message);
     	   else if(type.equals("manager"))
     		   response.sendRedirect("profileman.jsp?success="+message);
     	   else
     		  response.sendRedirect("empprofile.jsp?success="+message);
           }
    }
catch(Exception e){
    System.out.println(e);
    e.printStackTrace();
}
 %>  
</body>
</html>