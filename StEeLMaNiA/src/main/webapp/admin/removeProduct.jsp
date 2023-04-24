<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("delete from products where id='"+id+"'");
	while(rs.next()){
		response.sendRedirect("allProductEditProduct.jsp?msg=rem");
	}
}catch(Exception e){
	System.out.println(e);
}
%>