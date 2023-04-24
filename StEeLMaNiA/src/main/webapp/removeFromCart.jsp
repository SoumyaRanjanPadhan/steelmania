<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from carts where email='"+email+"' and product_id='"+product_id+"'");
	response.sendRedirect("myCart.jsp");
}catch(Exception e){
	
}
%>