
<?php

  session_start();
  ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);          

  $dbhost = "localhost";
  $dbuser = "web";
  $dbpass = "localpassword";
  $dbname = "eventsite";
  date_default_timezone_set("America/New_York");
  $db = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname) or die("cannot connect"); 


  mysqli_select_db($db, $dbname) or die("cannot select DB");

  $id = $_POST['id'];

  $query = "SELECT * FROM eventlocation WHERE eventID = $id";

  $result = mysqli_query($db, $query) or die(mysqli_error($db));

  $row = mysqli_fetch_array($result);

  $return_data =array();

  //$return_data = array('latitude'=>$row['latitude'], 'longitude'=> $row['longitude']);
  array_push($return_data, $row['latitude']);
  array_push($return_data, $row['longitude']);
  array_push($return_data, $row['eventID']);

  echo json_encode($return_data);

?>



