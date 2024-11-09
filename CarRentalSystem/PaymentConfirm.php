<?php
$servername = "localhost";
$username = "root";
$password = "08012003";
$dbname = "VehicleRentalManagementSystem";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve booking_id from the query string and ensure it's an integer
$booking_id = isset($_GET['booking_id']) ? intval($_GET['booking_id']) : 0;

if ($booking_id > 0) {
    // Check if an invoice already exists for this booking
    $invoice_sql = "SELECT Invoice_ID FROM Invoice WHERE Booking_ID = ?";
    $invoice_stmt = $conn->prepare($invoice_sql);
    $invoice_stmt->bind_param("i", $booking_id);
    $invoice_stmt->execute();
    $invoice_result = $invoice_stmt->get_result();

    if ($invoice_result->num_rows > 0) {
        // Get existing invoice_id
        $invoice_row = $invoice_result->fetch_assoc();
        $invoice_id = $invoice_row['Invoice_ID'];
    } else {
        // Generate a new invoice_id for this booking_id
        $create_invoice_sql = "INSERT INTO Invoice (Booking_ID, InvoiceStatus) VALUES (?, 'Generated')";
        $create_invoice_stmt = $conn->prepare($create_invoice_sql);
        $create_invoice_stmt->bind_param("i", $booking_id);
        $create_invoice_stmt->execute();
        $invoice_id = $create_invoice_stmt->insert_id;
    }

    // Fetch payment and booking details
    $sql = "SELECT p.Amount, b.BookingDate, b.BookingStatus 
            FROM Payment p
            JOIN Invoice i ON p.Invoice_ID = i.Invoice_ID
            JOIN Booking b ON i.Booking_ID = b.Booking_ID
            WHERE b.Booking_ID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $booking_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $amount = $row['Amount'];
        $booking_date = $row['BookingDate'];
        $booking_status = $row['BookingStatus'];
    } else {
        echo "No details found for Booking ID: " . $booking_id;
        exit();
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Confirm booking
        $confirm_sql = "UPDATE Booking SET BookingStatus = 'Confirmed' WHERE Booking_ID = ?";
        $confirm_stmt = $conn->prepare($confirm_sql);
        $confirm_stmt->bind_param("i", $booking_id);
        $confirm_stmt->execute();

        echo "Booking confirmed!";
        exit();
    }
} else {
    echo "Invalid Booking ID.";
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Payment Confirmation</title>
</head>
<body>
    <h1>Payment Confirmation</h1>
    <p>Booking ID: <?php echo $booking_id; ?></p>
    <p>Invoice ID: <?php echo $invoice_id; ?></p>
    <p>Payment Amount: <?php echo isset($amount) ? $amount : 'N/A'; ?></p>
    <p>Booking Date: <?php echo isset($booking_date) ? $booking_date : 'N/A'; ?></p>
    <p>Booking Status: <?php echo isset($booking_status) ? $booking_status : 'N/A'; ?></p>
    <form method="post">
        <input type="submit" value="Confirm Booking">
    </form>
</body>
</html>

<?php
$conn->close();
?>
