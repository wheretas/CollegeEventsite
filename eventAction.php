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
	

//////// NEED TO INSERT INTO "EVENTLOCATION" TABLE FIRST, THEN INSERT INTO ADMINCREATESEVENT TABLE. 



mysqli_select_db($db, $dbname) or die("cannot select DB");


	if(isset($_POST)) {

		$eventname = $_POST['title'];
		//echo "$rsoname";
		$type = $_POST['type'];
		//echo  " $domain";
		$category = $_POST['cat'];
		//echo " $id";
		$description = $_POST['description'];

		$date = $_POST['date'];

		$time = $_POST['time'];

		$contact_phone = $_POST['contact_phone'];

		$contact_email = $_POST['contact_email'];

		$locationName = $_POST['locationName'];

		$latitude = $_POST['latitude'];

		$longitude = $_POST['longitude'];

		
		//echo "member Emails $emails";

	}

	echo $category; 
	echo "     ";
	echo $type;
	//cheqear sino hay RSO repetido
	//agregar al admn
	//chequear si hay mas de 4 emails
	
	//echo "merpipeee";
	//echo "<script type="text/javascript">validateForm();</script>";

		$eventCreate = false;


		$createEvent = 
						"INSERT INTO eventlocation
							(locationName, latitude, longitude )					
						values
							('$locationName','$latitude', '$longitude')";


					$resultLocation = mysqli_query($db, $createEvent) or die(mysqli_error($db));

					
					echo $locationName;

		
		$autoInc = mysqli_insert_id($db);

		echo $autoInc;

		//checks if valid student 
		$query1 = 
		"SELECT * FROM users
 		WHERE email = '".$contact_email."'";
        $result1 = mysqli_query($db, $query1);

        //checks if name is not repeated in events table
        $query2 = 
        "SELECT * FROM admincreatesevent
        WHERE name = '".$eventname."'";
        $result2 = mysqli_query($db, $query2);



        	if(mysqli_num_rows($result2)>=1){ 
            		echo 'Repeated Event Name!';
  					//break;
        		}

        	if(mysqli_num_rows($result1)>=1){ 
        		echo 'The domain email is valid';

        			if(mysqli_num_rows($result2)>=1){ 
            		echo 'Repeated Event Name!';
  					//break;
        		}
				////MISSING DATENTIME AND LOCATION NAME AND EMAIL
				$createEvent = 
						"INSERT INTO admincreatesevent
							(name,email,category,type,contactEmail,contactPhone,description,locationName, eventID, date, time)					
						values
							('$eventname','$email','$category','$type','$contact_email','$contact_phone','$description','$locationName', '$autoInc', '$date', '$time')";


					$result3 = mysqli_query($db, $createEvent) or die(mysqli_error($db));
					
				}
         
        		

        		

        	

        	//check all emails and add to student joins RSO

        	else{
           		echo 'Not valid username';
           		//break;
      		}

  error_reporting(E_ALL) OR error_reporting(-1);


  


     header("Location: EventRequest.html"); 
            die("Redirecting to: EventRequest.html");  

	//close connection sql



	mysqli_close($db);

?>	