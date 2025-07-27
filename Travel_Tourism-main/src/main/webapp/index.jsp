<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel & Tourism</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script type="text/javascript">
   function register(){
	   window.location.href="Register.jsp";   
   }
   function login(){
	   window.location.href="Login.jsp";
   }
</script>
<style>
  body {
    background: url("https://i.pinimg.com/736x/59/d0/6d/59d06d80a3fa55d696c4039e7703e0f9.jpg") no-repeat center center fixed; 
    background-size: cover;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    width:100%;
    margin: 0;
  }
  .container {
    backdrop-filter: blur(10px); 
    background-color: rgba(32, 178, 170, 0.2); 
    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px; 
    border: 1px solid rgba(32, 178, 170, 0.3); 
    border-radius: 25px;
    width: 40%;
    padding: 20px;
    text-align: center;
  }
  .logo {
    display: block;
    margin: 0 auto 20px;
    max-width: 100%;
    height: auto;
  }
  .buttonContainer {
    display: flex;
    justify-content: space-around;
  }
  .btn {
        border-radius: 15px;
         outline-color: green; 
         background-color:rgba(32, 178, 170, 0.2); 
          box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
         } .btn:hover { 
         background-color: #20b2aa; 
         color: #fff; 
         border: 1px solid rgba(32, 178, 170, 0.3);
         box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px; 
          transition: box-shadow 0.6s ease-in-out;
         }
</style>
</head>
<body>
<div class="container">
  <img src="https://i.ibb.co/hLHjGNk/travel-LOGO.png" alt="travel-LOGO" class="logo">
  <div class="buttonContainer">
    <button onClick="register()" class="btn">REGISTER NOW</button>
    <button onClick="login()" class="btn">LOGIN</button>
  </div>
</div>
</body>
</html>
