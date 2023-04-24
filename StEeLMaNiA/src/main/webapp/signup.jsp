<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
<style>
.whysign {
 
  height: 444px;

}
</style>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
    <input type="text" name="name" placeholder="Enter Your Name" required>
    <input type="email" name="email" placeholder="Enter Your Email" required>
    <input type="number" name="mobile" placeholder="Enter Your Mobile No" required>
    <input type="password" name="password" placeholder="Enter Your Password" required>
    <input type="submit" value="Signup">
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  <h1>STEEL MANIA</h1>
    <p>Continuous improvement in our product and service portfolio, along with success in value creating initiatives for customers.</p>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h2 style="color:green;">Successfully Registered</h2>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h2 style="color:red;">Some thing Went Wrong! Try Again !</h2>
<%} %>
    
  </div>
</div>

</body>
</html>