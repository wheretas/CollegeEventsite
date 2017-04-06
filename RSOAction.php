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

	$id = $_POST['adminEmail'];
	echo $id;
	$rsoname = $_POST['title'];
	echo $rsoname;
	$domain = $_POST['school'];
	echo $domain;
	$emails = $_POST['memberEmails'];
			//$memberarray = explode(",",$emails);
			//echo $memberarray;*/


	//close connection sql
	mysqli_close($db);

?>	