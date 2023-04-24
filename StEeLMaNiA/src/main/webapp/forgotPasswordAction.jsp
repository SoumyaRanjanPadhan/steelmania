<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String emil=request.getParameter("email");
String mobile=request.getParameter("mobile");
String newpassword=request.getParameter("newpassword");

int check=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+emil+"' and mobile='"+mobile+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set password='"+newpassword+"' where email='"+emil+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	if(check==0){
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
}catch(Exception e){
	System.out.println(e);
}
%>