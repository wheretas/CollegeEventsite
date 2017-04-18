<?php

$dbhost = "localhost";
$dbuser = "web";
$dbpass = "localpassword";
$dbname = "eventsite";
$db = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname) or die("cannot connect"); 

 
mysqli_select_db($db, $dbname) or die("cannot select DB");

$email =      $_POST ['email'];
$first_name =       $_POST ['first_name'];
$last_name=  $_POST['last_name'];
$password =           $_POST ['password'];
$confirm = $_POST['passwordConfirm'];
$selectUser =           $_POST ['selectUser'];

$success = false;

if($selectUser == "1"){
	echo "You picked are student!!";


} else{
	echo "You are a SuperAdmin!!!";
}


if($password == $confirm){
		$query = 
			"INSERT INTO users
			(email,first_name,last_name,password)

			values

			('$email','$first_name','$last_name','$password')";


if($selectUser == "1"){
	$queryStudent = 
		"INSERT INTO student
		(email)

		values

		('$email')";

		$result2 = mysqli_query($db, $queryStudent);
		$sucess = true;

} 

if($selectUser == "2"){
	$querySuperAdmin = 
	"INSERT INTO superadmin
		(email)

		values

		('$email')";
		$result3 = mysqli_query($db, $querySuperAdmin);
		$sucess = true;
}

$result = mysqli_query($db, $query);
	

}

else{
	$success = false;
	$message = "Passwords Do Not Match.\\nTry again.";
                echo "<script type='text/javascript'>
                alert('$message');
                window.location.href = 'createFormBS.html';


                </script>";
         
}

if($success = true){
 header("Location: loginBootstrap.html"); 
            die("Redirecting to: loginBootstrap.html");
}
Echo "Database Saved"; 
mysqli_close($db);

?>
