<?php
session_start();
ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
$email = $_SESSION['varemail'];

$dbhost = "localhost";
$dbuser = "web";
$dbpass = "localpassword";
$dbname = "eventsite";
$db = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname) or die("cannot connect"); 
    //tests for err connection
    


$key = $_GET['key']; 







mysqli_select_db($db, $dbname) or die("cannot select DB");



 



        //checks if valid student 
        $query1 = 
        "SELECT * FROM admincreatesevent
        WHERE eventID = '".$key."'";
        $result1 = mysqli_query($db, $query1);

        $row = mysqli_fetch_array($result);

        $query2 = 
        "SELECT * FROM eventlocation
        WHERE eventID = '".$key."'";
        $result2 = mysqli_query($db, $query2);

        $row = mysqli_fetch_array($result2);
         

       

  error_reporting(E_ALL) OR error_reporting(-1);


  


    /* header("Location: EventRequest.html"); 
            die("Redirecting to: EventRequest.html");  */



?>  