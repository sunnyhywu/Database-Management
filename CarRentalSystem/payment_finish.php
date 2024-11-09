<?php
session_start();
include("mysql_connect.inc.php");

$booking_id = $_POST['booking_id'];
$amount = $_POST['amount'];
$payment_method = $_POST['payment_method'];

// Update the booking status to 'Paid'
$update_booking_sql = "UPDATE booking SET BookingStatus='Paid' WHERE Booking_ID='$booking_id'";
mysqli_query($conn, $update_booking_sql);

// Insert the payment details into the payment table
$insert_payment_sql = "INSERT INTO payment (Booking_ID, PaymentMethod, PaymentDate, Amount, PaymentStatus) VALUES ('$booking_id', '$payment_method', NOW(), '$amount', 'Completed')";
mysqli_query($conn, $insert_payment_sql);

echo 'Payment successful!';
echo '<meta http-equiv=REFRESH CONTENT=2;url=vehiclebooking.php>';
?>
