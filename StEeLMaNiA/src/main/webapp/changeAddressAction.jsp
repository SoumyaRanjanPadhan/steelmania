<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String add=request.getParameter("add");
String city=request.getParameter("city");
String state=request.getParameter("state");
try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update users set address=?,city=?,state=? where email=?");
	ps.setString(1, add);
	ps.setString(2, city);
	ps.setString(3, state);
	ps.setString(4, email);
	ps.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=valid");
}catch(Exception e){
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");

}
%>