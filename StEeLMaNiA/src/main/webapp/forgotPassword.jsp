<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
<style>
.whyforgotPassword{
height:386px;
}
.whyforgotPassword h2{
margin-top:5px;
}
</style>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgotPasswordAction.jsp" method="post">
     <input type="email" name="email" placeholder="Enter Your Email" required>
     <input type="number" name="mobile" placeholder="Enter Your Mobile No" required>
     <input type="password" name="newpassword" placeholder="Enter Your New Password" required>
     <input type="submit" value="Update">
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
   <h1>STEEL MANIA</h1>
   <p>Continuous improvement in our product and service portfolio, along with success in value creating initiatives for customers.</p> 
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h2 style="color:green;">Password Changed Successfully!</h2>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h2>Some thing Went Wrong! Try Again !</h2>
<%} %>
    
  </div>
</div>
</body>
</html>