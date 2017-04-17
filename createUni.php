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
	if(mysqli_connect_errno()){
		die("Database connection failed" . 
			mysqli_connect_error() . " (" . mysqli_connect_errno() . ")");
	}

	mysqli_select_db($db,$dbname);

	if(isset($_POST)) {

		$skoolname = $_POST['name'];
		//echo "$rsoname";
		$skoollocation = $_POST['location'];
		//echo  " $domain";
		$numStudents = $_POST['numStudents'];
		//echo " $id";
		$type = $_POST['type'];
		//echo "member Emails $emails";

	}


		$unitCreate = false;


		$createSkool = 
						"INSERT INTO superadmincreate
							(name, location, numStudents, type, email)					
						values
							('$skoolname','$skoollocation', '$numStudents', '$type', '$email')";


					$result= mysqli_query($db, $createSkool) or die(mysqli_error($db));

					
					
		
		

	

  error_reporting(E_ALL) OR error_reporting(-1);


  


     header("Location: CreateNewUni.html"); 
            die("Redirecting to: CreateNewUni.html");  

	//close connection sql



	mysqli_close($db);

?>	