<?php 
// Class import
require_once('class/userdata.class.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Foreign Key Example</title>
</head>
<body>


<?php 
// Set db values
$host = 'localhost';
$user = 'root';
$dbname = 'demo';
$passwd = 'root';

$userid = 2;
 

// Get User specigic data only 
// Example for user login dashboard

// Neue Instanz UserData
$instanz = new UserData($host, $user, $dbname, $passwd);

// Daten aus Tabelle `blogpost`auslesen
$userdata = $instanz->readMethod($userid);

// Daten ansehen
echo '<pre>';
print_r($userdata);
echo '</pre>';
?>

<div class="container">
  <h1>We want to display the blohgposts of the user that is currently logged in (User 2)</h1>
  <!-- Daten bereitstellen -->
  <?php foreach($userdata as $blogpost) { ?>
  <p><?=$blogpost['post_text'];?></p>

  <?php } ?>

</div>
  
</body>
</html>