
<?php
session_start();
$dbhost = "localhost";
$dbuser = "web";
$dbpass = "localpassword";
$dbname = "eventsite";
$db = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname) or die("cannot connect"); 

 //session_start();
mysqli_select_db($db, $dbname) or die("cannot select DB");

$name = $_SESSION['varcomm'];
$select= $_GET['del_id'];



//echo $select;











$sql = "DELETE FROM studentcomments WHERE id = $select";

$query=mysqli_query($db, $sql);




$key = "SELECT eventID FROM admincreatesevent WHERE name = '".$name."'";
 $query10=mysqli_query($db, $key);
    $result9 = mysqli_fetch_array($query10);
    $done = $result9['eventID'];


    header("Refresh:0; url=Event.html?key=$done"); 
                die("Redirecting to: index.html"); 











?>
