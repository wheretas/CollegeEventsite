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



$query = 
"INSERT INTO users
(email,first_name,last_name,password)

values

('$email','$first_name','$last_name','$password')";

$result = mysqli_query($db, $query);
Echo "Database Saved"; 
mysqli_close($db);

?>