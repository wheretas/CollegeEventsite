<?php
session_start();
ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
$email = $_SESSION['varemail'];
$key = $_SESSION['varkey'];

$dbhost = "localhost";
$dbuser = "web";
$dbpass = "localpassword";
$dbname = "eventsite";
$db = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname) or die("cannot connect"); 
    //tests for err connection
    

if(isset($_POST)) {

        $rating = $_POST['rating'];
        //echo "$rsoname";
        $comment = $_POST['comment'];
        //echo  " $domain";
       
        
        //echo "member Emails $emails";

    }








mysqli_select_db($db, $dbname) or die("cannot select DB");


$autoInc = mysqli_insert_id($db);
 



        //checks if valid student 
        $query1 = 
        "SELECT * FROM admincreatesevent
        WHERE eventID = '".$key."'";
        $result1 = mysqli_query($db, $query1);

        $row = mysqli_fetch_array($result1);

          $query2 = 
        "SELECT * FROM eventlocation
        WHERE eventID = '".$key."'";
        $result2 = mysqli_query($db, $query2);

        $row2 = mysqli_fetch_array($result2);

        $name = $row['name'];


        echo $email;
        echo $name;
        echo $comment;
        echo $rating;


      
		$query = 
		"INSERT INTO studentcomments
		(email,name,comment,rating,id)

		values

		('$email','$name','$comment','$rating', '$autoInc')";

        echo "databse inserted";

            $result = mysqli_query($db, $query);

        
       


        $_SESSION['varcomm'] = $name;


         
         


  error_reporting(E_ALL) OR error_reporting(-1);


  


/*     header("Location: EventRequest.html"); 
            die("Redirecting to: EventRequest.html");  */

            echo $name;

	$key = "SELECT eventID FROM admincreatesevent WHERE name = '".$name."'";
     $query10=mysqli_query($db, $key);
    $result9 = mysqli_fetch_array($query10);
    $done = $result9['eventID'];

   


    header("Refresh:0; url=Event.html?key=$done"); 
                die("Redirecting to: index.html"); 
?>  