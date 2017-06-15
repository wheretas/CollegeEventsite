
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


  $query = "SELECT * FROM admincreatesevent";

  $result = mysqli_query($db, $query) or die(mysqli_error($db));

  $currUserEmail = $_SESSION['varemail'];
  $currUserEmailEnd = substr($currUserEmail, strrpos($currUserEmail, '@')+1, strlen($currUserEmail));
    if(strrpos($currUserEmailEnd, 'ucf') !== false) {
      $currUserSchool = 'UCF';
    }
    if(strrpos($currUserEmailEnd, 'uf') !== false) {
      $currUserSchool = 'UF';
    }
    if(strrpos($currUserEmailEnd, 'fsu') !== false) {
      $currUserSchool = 'FSU';
    }
    if(strrpos($currUserEmailEnd, 'gt') !== false) {
      $currUserSchool = 'GT';
    }

    //retrieve RSO's student belongs to

    //$rsoQuery = "SELECT rsoName FROM studentjoinsrso WHERE email = $currUserEmail"
    //$rsoResult = mysqli_query($db, $rsoQuery) or die(mysqli_error($db));

  //Creates a loop to loop through results
  $mapEventIDs=array();
  $numEvents=0;
  while($row = mysqli_fetch_array($result)) { 

    //while($rsoRow = mysqli_fetch_array($rsoResult)) {
      //if($row['type'] == 'Private')
    //}

    //gets school of event
    $creatorEmail = $row['email']; 
    $emailEnd = substr($creatorEmail, strrpos($creatorEmail, '@')+1, strlen($creatorEmail));
    if(strrpos($emailEnd, 'ucf') !== false) {
      $eventSchool = 'UCF';
    }
    if(strrpos($emailEnd, 'uf') !== false) {
      $eventSchool = 'UF';
    }
    if(strrpos($emailEnd, 'fsu') !== false) {
      $eventSchool = 'FSU';
    }
    if(strrpos($emailEnd, 'gt') !== false) {
      $eventSchool = 'GT';
    }

    //determines if event should be dipslayed for user based on permissions:
    // public events today, private events that are at the same university as the user today, and  RSO Events that are of the RSO(s) the user belongs to happening today

      //need to add constraint for events of type rso_eveent 
      if( ($row['type'] == 'Public') || ($row['type'] == 'Private' && $currUserSchool == $eventSchool) ) {
        array_push($mapEventIDs, $row['eventID']);  
        $numEvents++;
      }
  }

  echo json_encode($mapEventIDs);

?>



