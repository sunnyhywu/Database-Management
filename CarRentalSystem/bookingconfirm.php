<?php
// Database connection
include('mysql_connect.inc.php');

if (isset($_GET['booking_id'])) {
    $booking_id = $_GET['booking_id'];

    // Fetch booking details using the Booking ID
    $query = "SELECT * FROM Booking WHERE Booking_ID = '$booking_id'";
    $result = mysqli_query($conn, $query);

    if ($result) {
        $booking = mysqli_fetch_assoc($result);
        // Fetch member details
        $member_query = "SELECT * FROM Members WHERE Member_ID = '".$booking['Member_ID']."'";
        $member_result = mysqli_query($conn, $member_query);
        $member = mysqli_fetch_assoc($member_result);

        // Fetch vehicle details
        $vehicle_query = "SELECT * FROM Vehicle WHERE Vehicle_ID = '".$booking['Vehicle_ID']."'";
        $vehicle_result = mysqli_query($conn, $vehicle_query);
        $vehicle = mysqli_fetch_assoc($vehicle_result);

        // Display booking details
        echo "<h1>Booking Confirmation</h1>";
        echo "<h2>Booking Details</h2>";
        echo "Booking ID: " . $booking['Booking_ID'] . "<br>";
        echo "Booking Date: " . $booking['BookingDate'] . "<br>";
        echo "Booking Status: " . $booking['BookingStatus'] . "<br>";

        echo "<h2>User Information</h2>";
        echo "Name: " . htmlspecialchars($member['MemberFirstName'] . ' ' . $member['MemberLastName']) . "<br>";
        echo "Email: " . htmlspecialchars($member['Email']) . "<br>";
        echo "Phone: " . htmlspecialchars($member['MemberPhoneNumber']) . "<br>";

        echo "<h2>Vehicle Information</h2>";
        echo "Brand: " . htmlspecialchars($vehicle['Brand']) . "<br>";
        echo "Model: " . htmlspecialchars($vehicle['Model']) . "<br>";
        echo "Price per Hour: $" . htmlspecialchars($vehicle['PricePerHour']) . "<br>";

        echo "<h2>Depart Details</h2>";
        echo "Location: " . htmlspecialchars($booking['Depart_ID']) . "<br>";

        echo "<h2>Return Details</h2>";
        echo "Location: " . htmlspecialchars($booking['Destination_ID']) . "<br>";

        echo "<h2>Total Amount</h2>";
        echo "$" . htmlspecialchars($booking['TotalAmount']) . "<br>";
    } else {
        echo "Error: " . mysqli_error($conn);
    }

    // Close the database connection
    mysqli_close($conn);
} else {
    echo "Booking ID not provided.";
}
?>
