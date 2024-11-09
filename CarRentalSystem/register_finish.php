<?php
include("mysql_connect.inc.php");

$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$email = $_POST['email'];
$password = $_POST['password'];
$password2 = $_POST['password2'];
$phone = $_POST['phone'];
$address = $_POST['address'];
$city = $_POST['city'];
$state = $_POST['state'];
$country = $_POST['country'];
$zipcode = $_POST['zipcode'];

if ($email != null && $password != null && $password2 != null && $password == $password2 && $phone != null && $address != null && $city != null && $state != null && $country != null && $zipcode != null) {
    $sql = "INSERT INTO members (MemberFirstName, MemberLastName, Email, MemberPassword, MemberPhoneNumber, Address, City, State, Country, ZipCode) VALUES ('$first_name', '$last_name', '$email', '$password', '$phone', '$address', '$city', '$state', '$country', '$zipcode')";
    if (mysqli_query($conn, $sql)) {
        echo 'Registration successful!';
        echo '<meta http-equiv=REFRESH CONTENT=1;url=index.php>';
    } else {
        echo 'Registration failed! Error: ' . mysqli_error($conn);
        echo '<meta http-equiv=REFRESH CONTENT=1;url=index.php>';
    }
} else {
    echo 'Incomplete data!';
    echo '<meta http-equiv=REFRESH CONTENT=1;url=index.php>';
}
?>
