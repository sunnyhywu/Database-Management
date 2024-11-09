<?php
session_start();
include("mysql_connect.inc.php");

$payment_method = $_POST['payment_method'];
$booking_id = $_POST['booking_id'];
$amount = $_POST['amount'];

if ($payment_method == 'credit_card') {
    header("Location: credit_card.php?booking_id=$booking_id&amount=$amount");
} elseif ($payment_method == 'line_pay') {
    header("Location: line_pay.php?booking_id=$booking_id&amount=$amount");
} elseif ($payment_method == 'remit') {
    header("Location: remit.php?booking_id=$booking_id&amount=$amount");
}
exit();
?>
