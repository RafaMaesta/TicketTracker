<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="../assets/css/home.css">
        <title>Time Tracker - Home</title>
    </head>

    <body>
        <?php echo $_SESSION['logged_in']['username']; ?>
        <button onclick="window.location='<?php echo site_url("Home/logout");?>'">Sair</button>
    </body>

</html>