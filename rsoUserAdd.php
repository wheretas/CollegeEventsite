
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
  

if(isset($_POST)) {

        $rsoName = $_POST['rsonames'];
        //echo "$rsoname";
      
    }



$autoInc = mysqli_insert_id($db);

$query = 
"INSERT INTO `studentjoinsrso` (`id`,`rsoName`, `email`) VALUES ('$autoInc' ,'$rsoName', '$email');";



$query1 = 
    "SELECT * FROM studentjoinsrso
    WHERE email = '".$email."' AND rsoName = '".$rsoName."' ";
        $result1 = mysqli_query($db, $query1);


if (!$query1) {
    die('Query failed to execute for some reason');
}

if (mysqli_num_rows($result1) > 0) {
    echo "User id exists already.";
}

if (!mysqli_num_rows($result1) > 0) {




if(mysqli_query($db, $query)){
    echo "Records inserted successfully.";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($db);
}

}
echo $rsoName;
echo $email;




 header("Location: RSOSearch.html"); 
            die("Redirecting to: RSOSearch.html"); 

mysqli_close($db);

?>