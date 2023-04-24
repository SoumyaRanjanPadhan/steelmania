
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<style> 
  .signup h2{
  font-size:20px;
  }
  .whysignLogin{
  height:338px;
  }
  
</style>
<body>
<div id='container'>
  <div class='signup'>
     <form action="loginAction.jsp" method="post">
     <input type="email" name="email" placeholder="Enter Your Email" required>
     <input type="password" name="password" placeholder="Enter Your Password" required>
     <input type="submit" value="login">
     </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  
    <h1>STEEL MANIA</h1>
    <p>Continuous improvement in our product and service portfolio, along with success in value creating initiatives for customers.</p>
    <%
    String msg=request.getParameter("msg");
    if("notexist".equals(msg)){
    %>
    <h2>Incorrect Username or Password</h2>
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