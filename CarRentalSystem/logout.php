<!-- logout.php -->
<?php
session_start();
session_destroy();
echo 'Logging out...';
echo '<meta http-equiv=REFRESH CONTENT=1;url=login.php>';
?>
