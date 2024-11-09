<?php 
session_start();
include("mysql_connect.inc.php");

if (!isset($_SESSION['email'])) {
    echo 'You are not logged in.';
    echo '<meta http-equiv=REFRESH CONTENT=1;url=login.php>';
    exit();
}

$booking_id = $_GET['booking_id'];
$amount = $_GET['amount'];
?>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="styles.css">
<html>
<head>
    <meta charset="utf-8">
    <title>Line Pay</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .container { width: 500px; margin: 0 auto; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; }
        .form-group input { width: 100%; padding: 8px; box-sizing: border-box; }
        .form-group button { padding: 10px 15px; }
    </style>
</head>
<body>
    <div class="container">
        <h3>Line Pay</h3>
        <p>Booking ID: <?php echo $booking_id; ?></p>
        <p>Amount: $<?php echo $amount; ?></p>
        <p>Scan the QR code to complete the payment</p>
        <img src="path_to_linepay_qr_code_image" alt="Line Pay QR Code" style="width:200px;height:auto;" />
        <form name="form" method="post" action="payment_finish.php">
            <input type="hidden" name="booking_id" value="<?php echo $booking_id; ?>" />
            <input type="hidden" name="amount" value="<?php echo $amount; ?>" />
            <input type="hidden" name="payment_method" value="line_pay" />
            <div class="form-group">
                <button type="submit">Confirm Payment</button>
            </div>
        </form>
    </div>
</body>
</html>
