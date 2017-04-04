
<?php
	
	
include("config.php");
$error = "";
$flag = 0;

if($_SERVER["REQUEST_METHOD"] == "POST") {
	$myfname = $_POST['fname'];
  $mylname = $_POST['lname'];
	$myemail = $_POST['email'];
  $desig = $_POST['desig'];

	
	$mypassword = $_POST['password'];

	$sql = "SELECT * FROM users WHERE email = '$myemail'";

	$result = mysqli_query($db,$sql);
    $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
    //$active = $row['active'];
    $count = mysqli_num_rows($result);

    if($count>0)
    {
    	$error = "Email Already exist";
    	$flag = 1;
    }
    else
    {
    	$sql = "INSERT INTO users (first_name, last_name, email, pssword) VALUES ('$myfname','$mylname','$myemail','$mypassword')";
    	if(mysqli_query($db, $sql))
      {

        if(strcmp($desig,'student')==0)
        {
          $sql = "INSERT INTO Student (email) VALUES ('$myemail')";
          mysqli_query($db, $sql);
        }
        if(strcmp($desig,'admin')==0)
        {
          $sql = "INSERT INTO admin (email) VALUES ('$myemail')";
          mysqli_query($db, $sql);
        }
        if(strcmp($desig,'superadmin')==0)
        {
          $sql = "INSERT INTO superadmin (email) VALUES ('$myemail')";
          mysqli_query($db, $sql);
        }




    		//header("location: registration-success.php");
    	}

    }




}



?>




<head>
  <link rel="stylesheet" type="text/css" href="login_css.css">
  <script>
function validateForm() {
    var x = document.forms["myForm"]["email"].value;
    var pass = document.forms["myForm"]["password"].value;
    var rpass = document.forms["myForm"]["rpassword"].value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }

    if (pass!=rpass)
    {
    	alert("Password does not match");
    	return false
    }
}
</script>
  

</head>


<br><br>
<H1 align  = "center"> EVENT SITE Registration </H1>

<div class="login-page">
<div class="form">
    
     <form class="login-form" name="myForm" action="register.php" method="POST" onsubmit="return validateForm();">
     <input type="text" name="fname" required="required" placeholder="First Name"/>
     <input type="text" name="lname" required="required" placeholder="Last Name"/>
      <input type="text" name="email" required="required" placeholder="Email"/>
      <input type="password" name="password" required="required" placeholder="Password"/>
      <input type="password" name="rpassword" required="required" placeholder="Confirm Password"/>
      <select name="desig" required="required">
         <option value="student">Student</option>
         <option value="admin">Admin</option>
         <option value="superadmin">Super Admin</option>
        
      </select>
      <br>
      <br>


      <button>Register</button>
      
      </form>
       <?php echo $error; ?>
  </div>
</div>