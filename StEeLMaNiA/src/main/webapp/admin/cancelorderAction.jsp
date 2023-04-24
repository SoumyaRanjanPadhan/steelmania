<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from carts where email='"+email+"' and product_id='"+id+"'");
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
}catch(Exception e){
	response.sendRedirect("ordersReceived.jsp?msg=invalid");

}
%>