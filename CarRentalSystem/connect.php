<?php 
session_start();
include("mysql_connect.inc.php");

$email = $_POST['email'];
$password = $_POST['password'];

$sql = "SELECT * FROM members WHERE Email = '$email'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);

if ($email != null && $password != null && $row['Email'] == $email && $row['MemberPassword'] == $password) {
    $_SESSION['email'] = $email;
    echo 'Login successful!';
    echo '<meta http-equiv=REFRESH CONTENT=1;url=member.php>';
} else {
    echo 'Login failed!';
    echo '<meta http-equiv=REFRESH CONTENT=1;url=index.php>';
}
?>
