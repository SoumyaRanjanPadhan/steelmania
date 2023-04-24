wa<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;

int a=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from products where id='"+product_id+"'");
	while(rs.next()){
		product_price=rs.getInt(4);
		product_total=product_price;
	}
	ResultSet rs1=st.executeQuery("select * from carts where product_id='"+product_id+"' and email='"+email+"'");
	while(rs1.next()){
		cart_total=rs1.getInt(5);
		cart_total=cart_total+product_total;
		quantity=rs1.getInt(3);
		quantity=quantity+1;
		a=1;
	}
	if(a==1){
		st.executeUpdate("update carts set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+product_id+"' and email='"+email+"'");
	    response.sendRedirect("home.jsp?msg=exist");
	}
	if(a==0){
		PreparedStatement ps=con.prepareStatement("insert into carts(email,product_id,quantity,price,total) values(?,?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, product_id);
		ps.setInt(3, quantity);
		ps.setInt(4, product_price);
		ps.setInt(5, product_total);
		ps.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");
	}
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");
}
%>