
<?php
session_start();
$dbhost = "localhost";
$dbuser = "web";
$dbpass = "localpassword";
$dbname = "eventsite";
$db = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname) or die("cannot connect"); 

 //session_start();
mysqli_select_db($db, $dbname) or die("cannot select DB");


$select= $_GET['del_id'];



echo $select;




$sql = "DELETE FROM studentcomments WHERE id = $select";

$query=mysqli_query($db, $sql);

header("Location: index.html"); 
            die("Redirecting to: index.html");

?>
