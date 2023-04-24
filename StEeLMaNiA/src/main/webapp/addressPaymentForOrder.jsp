<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>

</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
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
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
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
            <td><%=rs1.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs1.getString(4) %></td>
            <td><%=rs1.getString(7) %> </td>
            <td><i class="fa fa-inr"></i><%=rs1.getString(9) %> </td>
            </tr>
      <%
       }
ResultSet rs2=st.executeQuery("select * from users where email='"+email+"'");
while(rs2.next()){
      %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-">
 <h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=rs2.getString(5)%>" placeholder="Enter address" required>
 </div>

<div class="right-">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs2.getString(6)%>" placeholder="Enter city" required>

</div> 

<div class="left-">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs2.getString(7)%>" placeholder="Enter state" required>

</div>


<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-">
<h3>Select way of Payment</h3>
 <select class="input-style" name="paymentmethod">
 <option value="cash on delivery(COD)">Cash on delivery(COD)</option>
 <option value="online">Online payment</option>
 </select>
</div>


<hr style="width: 100%">

<div class="left-">
<h3>Mobile Number</h3>
<input class="input-style" type="number" name="mobile" value="<%=rs2.getString(3)%>" placeholder="Enter Mobile no" required>
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div><br>
<div class="right-">
<button class="button" type="submit">Proceed<i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
  <%

}
}catch(Exception e){
}
  %> 
      <br>
      <br>
      <br>

</body>
</html>