<?php

	$dbhost = "localhost";
	$dbuser = "web";
	$dbpass = "localpassword";
	$dbname = "eventsite";
	$db = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);

	//tests for err connection
	if(mysqli_connect_errno()){
		die("Database connection failed" . 
			mysqli_connect_error() . " (" . mysqli_connect_errno() . ")");
	}

	mysqli_select_db($db,$dbname);

	if(isset($_POST)) {

		$rsoname = $_POST['title'];
		//echo "$rsoname";
		$domain = $_POST['school'];
		//echo  " $domain";
		$id = $_POST['adminEmail'];
		//echo " $id";
		$emails = $_POST['memberEmails'];
		//echo "member Emails $emails";

	}
	//cheqear sino hay RSO repetido
	//agregar al admn
	//chequear si hay mas de 4 emails
	
	//echo "merpipeee";
	//echo "<script type="text/javascript">validateForm();</script>";

		$rsoCreate = false;

		//checks if valid student 
		$query1 = 
		"SELECT * FROM student
 		WHERE email = '".$id."'";
        $result1 = mysqli_query($db, $query1);

        //checks if name is not repeated
        $query2 = 
        "SELECT * FROM rso
        WHERE rsoNAME = '".$rsoname."'";
        $result2 = mysqli_query($db, $query2);


        	if(mysqli_num_rows($result1)>=1){ 
        		echo 'The domain email is valid';
         
        		if(mysqli_num_rows($result2)>=1){ 
            		echo 'Repeated RSO Name!';
  					//break;
        		}

        		else{
        			$query3 = 
						"INSERT INTO admin
							(email)
						values
							('$id')";

					$query4 = 
						"INSERT INTO RSO
							(rsoNAME,email)
						values
							('$rsoname','$id')";

					$result3 = mysqli_query($db, $query3);
					$result4 = mysqli_query($db, $query4);

        		}

        	}

        	//check all emails and add to student joins RSO

        	else{
           		echo 'Not valid username';
           		//break;
      		}




     //header("Location: RSORequest.html"); 
          //  die("Redirecting to: RSORequest.html");

	//close connection sql
	mysqli_close($db);

?>	