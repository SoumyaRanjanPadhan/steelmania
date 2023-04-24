<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String mobile=request.getParameter("mobile");
String paymentmethod=request.getParameter("paymentmethod");
String status="bill";
try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update users set address=?,city=?,state=?,mobile=? where email=?");
	ps.setString(1, address);
	ps.setString(2, city);
	ps.setString(3, state);
	ps.setString(4, mobile);
	ps.setString(5, email);
	ps.executeUpdate();
	
	PreparedStatement ps1=con.prepareStatement("update carts set address=?,city=?,state=?,mobile=?,paymentmethod=? where email=?");
	ps1.setString(1, address);
	ps1.setString(2, city);
	ps1.setString(3, state);
	ps1.setString(4, mobile);
	ps1.setString(5, paymentmethod);
	ps1.setString(6, email);
	ps1.executeUpdate();
	
	response.sendRedirect("bill.jsp");
}catch(Exception e){
	
}

%>