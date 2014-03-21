<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
 
   <%
   try{
     String s[]=null;
 
     Class.forName("com.ibm.db2.jcc.DB2Driver");
     Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
Statement st=con.createStatement();
     String id=(String)session.getAttribute("id");
     ResultSet rs1=st.executeQuery("select comp from empdet where id='"+id+"'");
     rs1.next();
     String compemail=rs1.getString(1);
 	session.setAttribute("email",compemail);
     ResultSet rs = st.executeQuery("select * from empdet where comp='"+compemail+"'");
     String radioButton="name";
 
       List li = new ArrayList();
       while(rs.next())
       {
           li.add(rs.getString(2));
           li.add(rs.getString(3));
       }
   
       String[] str = new String[li.size()];
       Iterator it = li.iterator();
 
       int i = 0;
       while(it.hasNext())
       {
           String p = (String)it.next();
           str[i] = p;
           i++;
       }
 
    //jQuery related start
       String query = (String)request.getParameter("q");
 
       int cnt=1;
       for(int j=0;j<str.length;j++)
       {
           if(str[j].toUpperCase().startsWith(query.toUpperCase()))
           {
              out.print(str[j]+"\n");
              if(cnt>=5)// 5=How many results have to show while we are typing(auto suggestions)
              break;
              cnt++;
            }
       }
    //jQuery related end
 
rs.close();
st.close();
con.close();
 
}
catch(Exception e){
e.printStackTrace();
}
 
//www.java4s.com
%>