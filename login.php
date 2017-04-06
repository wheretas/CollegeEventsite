<?php
session_start();
$dbhost = "localhost";
$dbuser = "web";
$dbpass = "localpassword";
$dbname = "eventsite";
$db = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname) or die("cannot connect"); 

 //session_start();
mysqli_select_db($db, $dbname) or die("cannot select DB");


if (isset($_POST)) {

$email =      $_POST ['email'];
$password =           $_POST ['password'];
}

$login_ok = false;



$tempUserRole = 0;





        

       $query1 = 
		"SELECT * FROM student
 		WHERE email = '".$email."'";
        $result1 = mysqli_query($db, $query1);

        $query2 = 
        "SELECT * FROM superadmin
        WHERE email = '".$email."'";


        $result2 = mysqli_query($db, $query2);

 		
        while(($result1 || $result2) >= 1){

        if(mysqli_num_rows($result1)>=1)
            { 
        	 $tempUserRole = 1;
        	 echo 'The username or password are correct!';
            $login_ok = true;
            break;

            }

        if(mysqli_num_rows($result2)>=1)
            { 
             $tempUserRole = 2;
             echo 'The username or password are correct!';
            $login_ok = true;
            break;

            }


        else
            {
           echo 'The username or password are incorrect!';
           break;
            }


        
        }

     
$_SESSION['varname'] = $tempUserRole;


Echo "Database Saved"; 
mysqli_close($db);


if($login_ok == true){

 header("Location: index.html"); 
            die("Redirecting to: index.html");

        }

?>