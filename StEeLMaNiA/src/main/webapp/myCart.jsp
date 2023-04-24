<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>


<table>
<thead>
<%
int total=0;
int sno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from carts where email='"+email+"'");
	while(rs.next()){
		total=rs.getInt(1);
	}

%>
          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total);%> </th>
           <%if(total>0){ %> <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
<%
ResultSet rs1=st.executeQuery("select * from products inner join carts on products.id=carts.product_id and carts.email='"+email+"'");
while(rs1.next()){
%>   
          <tr>
<%sno=sno+1; %>
            <td><%out.println(sno); %></td>
            <td><%=rs1.getString(2) %></td>
            <td><%=rs1.getString(3)%></td>
            <td><i class="fa fa-inr"></i><%=rs1.getString(4)%> </td>
            <td><a href="incDecQuanAction.jsp?id=<%=rs1.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs1.getString(7) %>&nbsp;<a href="incDecQuanAction.jsp?id=<%=rs1.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs1.getString(9) %> </td>
            <td><a href="removeFromCart.jsp?id=<%=rs1.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%
}
}catch(Exception e){}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>