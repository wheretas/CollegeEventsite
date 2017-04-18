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

	$domainlist = array("@ucf.edu","@uf.edu","@fsu.edu","@gt.edu");

	$splitEmails = explode(",",$emails);
	$domainNew = $domain -1;

	$check =validateInfo($rsoname,$domain,$id,$splitEmails,$db,$domainlist);

	echo "$check";

	//echo "merpipee";
	$autoInc = mysqli_insert_id($db);

	if($check ==1){
		
		populateDatabase($id,$rsoname,$splitEmails,$db,$autoInc);
		echo "input in database";
	}   

function validateInfo($rso,$domain,$id,$emails,$database,$schools){
	$query1 = 
		"SELECT * FROM student
 		WHERE email = '".$id."'";
    
    $result1 = mysqli_query($database, $query1);

    //checks if name is not repeated
    //echo "totaaa         ";
    $query2 = 
     	"SELECT * FROM rso
        WHERE rsoNAME = '".$rso."'";
        
    $result2 = mysqli_query($database, $query2);

    if(mysqli_num_rows($result1)>=1){ 
       	echo "The admin email is valid"; 

        if(mysqli_num_rows($result2)>=1){ 
            echo "Repeated RSO Name!";
  			return 0;
        }
    }

    else{
    	echo "admin email is invalid";
        return 0;
    }


	foreach( $emails as $em){
		//echo $em;
		$emailquery = "SELECT * FROM student
 						WHERE email = '".$em."'";

       	$result1 = mysqli_query($database, $emailquery);

        $validateDom = strpos($em, $schools[$domain-1]);
        //echo $validateDom;

       	if(mysqli_num_rows($result1)<1 or $validateDom < 1){
        	return 0;
        } 

        //echo "merd";
        		
	}

	return 1;

}


function populateDatabase($id,$rsoname,$emails,$db,$autoInc){



		//populate db from rso request
//$autoInc = mysqli_insert_id($db);
//$query1 = 
//"INSERT INTO `studentjoinsrso` (`id`,`rsoName`, `email`) VALUES ('$autoInc' ,'$rsoname', 'jpattee@ucf.edu');";
		//$res = mysqli_query($db, $query1);



	

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



	foreach ($emails as $em) {
		
		
		echo $autoInc;
		$query1 = 
		"INSERT INTO `studentjoinsrso` (`id`,`rsoName`, `email`) VALUES ('$autoInc' ,'$rsoname', '$em');";
		$res = mysqli_query($db, $query1);
		$autoInc++;
	}


}
 
(header("Location: RSORequest.html"); 
            die("Redirecting to: RSORequest.html"); 

	//close connection sql
	mysqli_close($db);


?>	