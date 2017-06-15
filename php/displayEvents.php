
<!-- 
//this code has been directly inserted into myEvents.html
// to make this work, change your  C:\xampp\apache\conf\httpd.conf file by adding the following lines at the bottom of the document. after changing file
// save and restart the apache server

<IfModule mod_mime.c>
 AddType application/x-httpd-php .php
AddType application/x-httpd-php .phtml
AddType application/x-httpd-php .php3
AddType application/x-httpd-php .php4
AddType application/x-httpd-php .html
AddType application/x-httpd-php-source .phps
</IfModule>


-->


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


          mysqli_select_db($db, $dbname) or die("cannot select DB");


          $query = "SELECT * FROM admincreatesevent";

          $result = mysqli_query($db, $query) or die(mysqli_error($db));

          echo "<tbody>";
          while($row = mysqli_fetch_array($result)){   //Creates a loop to loop through results
          echo "<tr><td>" . $row['eventID'] . "</td><td>" . $row['name'] . "</td><td>" . $row['date'] . "</td><td>" . $row['locationName'] .  "</td><td>" . $row['category'] ."</td></tr>";  
          }

          echo "</tbody>"; //Close the table in HTML



            mysqli_close($db);

          ?>  