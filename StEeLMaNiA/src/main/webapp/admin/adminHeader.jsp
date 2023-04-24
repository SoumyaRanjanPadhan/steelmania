<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    
    <br>
    <div class="topnav sticky">
   <%String email=session.getAttribute("email").toString(); %>
            <center><h2><font size="30">STEEL MANIA</font></h2></center>
            <h2><a href=""> <i class='fas fa-user-alt'></i><%out.println(email); %></a></h2>
            <a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a>
            <a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fas fa-bars'></i></a>
           
            <a href="ordersReceived.jsp">Orders Received <i class="fas fa-archive"></i></a>
            
            <a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>
          </div>
           <br>
           
