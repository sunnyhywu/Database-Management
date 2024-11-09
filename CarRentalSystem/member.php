<!-- member.php -->
<?php
session_start();
if (isset($_SESSION['email'])) {
    echo 'Welcome, ' . $_SESSION['email'] . '!';
    echo '<br><br>';
    echo '<form method="post" action="logout.php" style="display:inline;">';
    echo '<input type="submit" value="Logout" />';
    echo '</form>';
    echo ' ';
    echo '<form method="post" action="vehiclebooking.php" style="display:inline;">';
    echo '<input type="submit" value="Book a Vehicle" />';
    echo '</form>';
} else {
    echo 'You are not logged in.';
    echo '<meta http-equiv=REFRESH CONTENT=1;url=login.php>';
}
?>
