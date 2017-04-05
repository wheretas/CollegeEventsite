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
$selectUser =           $_POST ['selectUser'];



if($selectUser == "1"){
	echo "You picked are student!!";
} else{
	echo "You are a SuperAdmin!!!";
}


$query = 
"INSERT INTO users
(email,first_name,last_name,password)

values

('$email','$first_name','$last_name','$password')";

$result = mysqli_query($db, $query);

 header("Location: loginBootstrap.html"); 
            die("Redirecting to: loginBootstrap.html");
Echo "Database Saved"; 
mysqli_close($db);

?>