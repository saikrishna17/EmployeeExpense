

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class pageServlet
 */
@WebServlet("/pageServlet")
public class pageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n\n\nsai ki pichaaaa!!\n");
		try{
			HttpSession session = request.getSession();
			String value=request.getParameter("dest").toString().trim();
			System.out.println("value:"+value);
		RequestDispatcher requestDispatcher ; 
		if(value.equalsIgnoreCase("save"))
		{
			System.out.println("in if:"+value);
			System.out.println("vsave.jsp lo vacha");
			String pdate=request.getParameter("pdate");	
			System.out.println("date saved");
			
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
		    if(farest!="")
		    {
		    fare=Integer.parseInt(farest);
		    }
		    if(lchargest!="")
		    {
		    lcharge=Integer.parseInt(lchargest);
		    }
		    if(bchargest!="")
		    {
		    bcharge=Integer.parseInt(bchargest);
		    }
		    if(appdistst!="")
		    {
		    appdist=Integer.parseInt(appdistst);
		    }
		    if(cpaidst!="")
		    {
		    cpaid=Integer.parseInt(cpaidst);
		    }
		    if(amnt!="")
		    {
		    amount=Integer.parseInt(amnt);
		    }
		    String id=(String)session.getAttribute("id");
		    Class.forName("com.ibm.db2.jcc.DB2Driver");
		    Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/EMPLOYEE","admin","admin");
		    st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		           st2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		    
		           rs=st.executeQuery("select max(vid) from vdrafts");
		           System.out.println("vsave.jsp lo after rs");
		           if(rs!=null)
		           {
		           //rs.first();
		           System.out.println("vsave.jsp lo in rs if");
		           rs.next();
		           countst=rs.getString("vid");
		           
		           if(countst==null)
		           {
		        	   count=0;
		           }
		        	  else
		        	  {
		        	count=Integer.parseInt(countst);
		        	  }
		           
		           count++;
		           st.executeUpdate("insert into vdrafts(pdate,pvis,dod,doa,sender) values ('"+pdate+"','"+places+"','"+dod+"','"+doa+"','"+id+"')");
		           st.executeUpdate("insert into vfared values ("+count+",'"+tdate+"','"+tfrom+"','"+tto+"','"+mode+"','"+classveh+"',"+fare+",'"+tickno+"')");
		     
		            st.executeUpdate("insert into vhaltd values ("+count+","+lcharge+","+bcharge+")");
		            
		            st.executeUpdate("insert into vcond values ("+count+",'"+radd+"','"+cdate+"','"+cfrom+"','"+cto+"',"+appdist+",'"+cmode+"',"+cpaid+",'"+rem+"')");
		            st.executeUpdate("insert into votherd values ("+count+",'"+part+"',"+amount+",'"+reme+"')");
		            String message="Voucher saved" ;
		            String type=(String)session.getAttribute("type");
		     	   if(type.equals("admin"))
		             response.sendRedirect("profile.jsp?success="+message);
		     	   else if(type.equals("manager"))
		     		   response.sendRedirect("profileman.jsp?success="+message);
		     	   else
		     		  response.sendRedirect("empprofile.jsp?success="+message);
		           }
		
		//requestDispatcher = request.getRequestDispatcher("/vsave.jsp" ) ; requestDispatcher.forward( request, response ) ;
		}
		else
		{
			System.out.println("in else:"+value);
			requestDispatcher = request.getRequestDispatcher("/voucher.jsp" ) ; requestDispatcher.forward( request, response ) ;
		}
		}
		
		 catch(Exception e){
			    System.out.println(e);
			}
	}

}
