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

// Retrieve member_id from the query string and ensure it's an integer
$member_id = isset($_GET['member_id']) ? intval($_GET['member_id']) : 0;

if ($member_id > 0) {
    // Fetch booking information for the member
    $sql = "SELECT b.Booking_ID, b.BookingDate, b.BookingStatus, i.Invoice_ID, p.Amount 
            FROM Booking b
            JOIN Invoice i ON b.Booking_ID = i.Booking_ID
            JOIN Payment p ON i.Invoice_ID = p.Invoice_ID
            WHERE b.Member_ID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $member_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $bookings = $result->fetch_all(MYSQLI_ASSOC);
    } else {
        echo "No bookings found for Member ID: " . $member_id;
        exit();
    }
} else {
    echo "Invalid Member ID.";
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>History Order</title>
</head>
<body>
    <h1>History Order</h1>
    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>Booking Date</th>
            <th>Booking Status</th>
            <th>Invoice ID</th>
            <th>Payment Amount</th>
        </tr>
        <?php foreach ($bookings as $booking): ?>
        <tr>
            <td><?php echo $booking['Booking_ID']; ?></td>
            <td><?php echo $booking['BookingDate']; ?></td>
            <td><?php echo $booking['BookingStatus']; ?></td>
            <td><?php echo $booking['Invoice_ID']; ?></td>
            <td><?php echo $booking['Amount']; ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>

<?php
$conn->close();
?>
