<?php

include("config.php");
session_start();


$error = "";
if($_SERVER["REQUEST_METHOD"] == "POST") {

	$myemail = $_POST['email'];
	$mypassword = $_POST['password'];

	$sql = "SELECT * FROM users WHERE email = '$myemail' AND pssword = '$mypassword'";
    $result = mysqli_query($db,$sql);
      $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
      $active = $row['active'];
      
      $count = mysqli_num_rows($result);
      
      // If result matched $myusername and $mypassword, table row must be 1 row
		
      if($count == 1) {
         
         $_SESSION["email"] = $row["email"];
         
         header("location: index.php");
      }else {
         $error = "Your Login Email or Password is invalid";
         
      }
   }
?>
<head>
  <link rel="stylesheet" type="text/css" href="login_css.css">
  

</head>

<br><br>
<H1 align  = "center"> EventSite </H1>
<div class="login-page">
  <div class="form">
    
    <form class="login-form" action="login.php" method="POST">
      <input type="text" name="email" placeholder="Email"/>
      <input type="password" name="password" placeholder="Password"/>
      <button>login</button>
      <p class="message">Not registered? <a href="register.php">Create an account</a></p>
      </form>
      <?php echo $error; ?>
  </div>
</div>




