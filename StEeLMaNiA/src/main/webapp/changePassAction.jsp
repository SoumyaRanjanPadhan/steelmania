<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String oldpass=request.getParameter("oldpass");
String newpass=request.getParameter("newpass");
String cnfpass=request.getParameter("cnfpass");
if(!cnfpass.equals(newpass))
	response.sendRedirect("changePassword.jsp?msg=notmatch");
else{
	int check=0;
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+oldpass+"'");
		while(rs.next()){
			check=1;
			st.executeUpdate("update users set password='"+newpass+"' where email='"+email+"'");
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		if(check==0)
			response.sendRedirect("changePassword.jsp?msg=wrong");

	}catch(Exception e){
		
	}
}
%>