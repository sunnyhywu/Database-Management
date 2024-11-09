<?php
session_start();

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

// Retrieve member_id from session
$member_id = isset($_SESSION['member_id']) ? intval($_SESSION['member_id']) : 0;

if ($member_id > 0) {
    // Fetch member information
    $sql = "SELECT * FROM members WHERE Member_ID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $member_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $member = $result->fetch_assoc();
    } else {
        echo "No member found with ID: " . $member_id;
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
    <title>Member Corner</title>
</head>
<body>
    <h1>Member Corner</h1>
    <p>Member ID: <?php echo $member['Member_ID']; ?></p>
    <p>First Name: <?php echo $member['MemberFirstName']; ?></p>
    <p>Last Name: <?php echo $member['MemberLastName']; ?></p>
    <p>Email: <?php echo $member['Email']; ?></p>
    <p>Phone Number: <?php echo $member['MemberPhoneNumber']; ?></p>
    <!-- Add other member information fields as needed -->

    <form action="historyOrder.php" method="get">
        <input type="hidden" name="member_id" value="<?php echo $member_id; ?>">
        <input type="submit" value="History Order">
    </form>
</body>
</html>

<?php
$conn->close();
?>
