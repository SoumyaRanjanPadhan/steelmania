<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}

.input-style{
margin-left:42%;
width:250px;
}
.button{
width:400px;
margin-left:37%;
}

</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
String id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from products where id='"+id+"'");
	while(rs.next()){
%>

<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
<div class="1">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" required>

</div>

<div class="2">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" value="<%=rs.getString(3)%>" required>

</div>

<div class="3">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price" value="<%=rs.getString(4)%>" required>

</div><br>

 <button class="button">Update</button>
 </form>
<%
	}
}catch(Exception e){}
%>


</body>
<br><br><br>
</body>
</html>