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
    <title>Credit Card Payment</title>
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
        <h3>Credit Card Payment</h3>
        <p>Booking ID: <?php echo $booking_id; ?></p>
        <p>Amount: $<?php echo $amount; ?></p>
        <form name="form" method="post" action="payment_finish.php">
            <div class="form-group">
                <label>Card Number:</label>
                <input type="text" name="card_number" required>
            </div>
            <div class="form-group">
                <label>Expiry Date:</label>
                <input type="text" name="expiry_date" required>
            </div>
            <div class="form-group">
                <label>CVV:</label>
                <input type="text" name="cvv" required>
            </div>
            <input type="hidden" name="booking_id" value="<?php echo $booking_id; ?>" />
            <input type="hidden" name="amount" value="<?php echo $amount; ?>" />
            <input type="hidden" name="payment_method" value="credit_card" />
            <div class="form-group">
                <button type="submit">Pay</button>
            </div>
        </form>
    </div>
</body>
</html>
