<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String mob=request.getParameter("mob");
String pass=request.getParameter("pass");
int check=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+pass+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set mobile='"+mob+"' where email='"+email+"'");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
	}
	if(check==0)
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");

}catch(Exception e){}
%>