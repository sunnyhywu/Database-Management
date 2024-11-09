<?php 
session_start();
include("mysql_connect.inc.php");

if (!isset($_SESSION['email'])) {
    echo 'You are not logged in.';
    echo '<meta http-equiv=REFRESH CONTENT=1;url=index.php>';
    exit();
}

$email = $_SESSION['email'];
$sql = "SELECT * FROM members WHERE Email='$email'";
$result = mysqli_query($conn, $sql);
$user = mysqli_fetch_assoc($result);

if (!$user) {
    echo 'User information not found!';
    exit();
}
// Function to generate a unique Booking ID
function generateBookingID($conn) {
    $unique = false;
    while (!$unique) {
        $booking_id = uniqid('BKG');
        $sql = "SELECT * FROM Booking WHERE Booking_ID='$booking_id'";
        $result = mysqli_query($conn, $sql);
        if (mysqli_num_rows($result) == 0) {
            $unique = true;
        }
    }
    return $booking_id;
}

// Assuming the form data is received via POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $member_id = $user['Member_ID']; // Assuming $user contains the logged-in user's data
    $vehicle_id = $_POST['vehicle_id'];
    $depart_id = $_POST['depart_id'];
    $destination_id = $_POST['destination_id'];
    $booking_date = date('Y-m-d H:i:s');
    $booking_status = 'Booked';
    $total_amount = $_POST['total_amount'];

    // Generate a unique Booking ID
    $booking_id = generateBookingID($conn);

    // Insert booking data
    $sql = "INSERT INTO Booking (Booking_ID, Member_ID, Vehicle_ID, Depart_ID, Destination_ID, BookingDate, BookingStatus, TotalAmount) VALUES ('$booking_id', '$member_id', '$vehicle_id', '$depart_id', '$destination_id', '$booking_date', '$booking_status', '$total_amount')";

    if (mysqli_query($conn, $sql)) {
        // Redirect to confirmation page with the booking ID
        echo '<meta http-equiv=REFRESH CONTENT=1;url=bookingconfirm.php?Booking_ID='.$booking_id.'>';
    } else {
        echo "Error: " . mysqli_error($conn);
    }

    // Close the database connection
    mysqli_close($conn);
}

?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Vehicle Booking</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; background-color: #fff; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group input, .form-group select { width: 100%; padding: 8px; box-sizing: border-box; }
        .vehicle-list { display: flex; flex-wrap: wrap; gap: 20px; }
        .vehicle-card { background-color: #fff; border: 1px solid #ddd; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); width: calc(33.333% - 20px); cursor: pointer; }
        .vehicle-card img { width: 100%; height: auto; }
        .vehicle-card .details { padding: 15px; }
        .vehicle-card .details p { margin: 0 0 10px; }
        .vehicle-card .details .price { font-size: 18px; font-weight: bold; color: #e60000; }
        .vehicle-card.selected { border: 2px solid #e60000; }
        .user-info, .booking-info { margin-bottom: 20px; }
        .total-amount { font-size: 24px; font-weight: bold; color: #e60000; text-align: right; }
    </style>
    <script>
        function showModels(brand) {
            var models = document.getElementsByClassName('vehicle-models');
            for (var i = 0; i < models.length; i++) {
                models[i].style.display = 'none';
            }
            var selectedBrandModels = document.getElementsByClassName(brand);
            for (var i = 0; i < selectedBrandModels.length; i++) {
                selectedBrandModels[i].style.display = 'block';
            }
        }

        function validateDates() {
            var departDate = new Date(document.getElementById("depart_date").value + "T" + document.getElementById("depart_time").value);
            var returnDate = new Date(document.getElementById("return_date").value + "T" + document.getElementById("return_time").value);
            if (returnDate < departDate) {
                alert("Return date and time cannot be earlier than depart date and time.");
                return false;
            }
            return true;
        }

        function calculateTotalAmount() {
            var departDate = new Date(document.getElementById("depart_date").value + "T" + document.getElementById("depart_time").value);
            var returnDate = new Date(document.getElementById("return_date").value + "T" + document.getElementById("return_time").value);
            if (departDate && returnDate && returnDate > departDate) {
                var hours = Math.abs(returnDate - departDate) / 36e5;
                var rate = parseFloat(document.querySelector('.vehicle-card.selected').dataset.rate);
                var totalAmount = hours * rate;
                document.getElementById("total_amount").innerText = "$" + totalAmount.toFixed(2);
                document.getElementById("hidden_total_amount").value = totalAmount.toFixed(2);
            }
        }

        function updateSelectedVehicle(vehicleId) {
            var vehicles = document.getElementsByClassName('vehicle-card');
            for (var i = 0; i < vehicles.length; i++) {
                vehicles[i].classList.remove('selected');
            }
            var selectedVehicle = document.getElementById('vehicle_' + vehicleId);
            selectedVehicle.classList.add('selected');
            var rate = parseFloat(selectedVehicle.dataset.rate);
            document.getElementById("price_per_hour").innerText = "$" + rate.toFixed(2) + " per hour";
            calculateTotalAmount();
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            var today = new Date().toISOString().split('T')[0];
            document.getElementById("depart_date").setAttribute('min', today);
            document.getElementById("return_date").setAttribute('min', today);
            document.getElementById("depart_date").addEventListener('change', calculateTotalAmount);
            document.getElementById("depart_time").addEventListener('change', calculateTotalAmount);
            document.getElementById("return_date").addEventListener('change', calculateTotalAmount);
            document.getElementById("return_time").addEventListener('change', calculateTotalAmount);
        });
    </script>
</head>
<body>
    <div class="container">
        <h1>Vehicle Booking</h1>
        <div class="user-info">
            <h2>User Information</h2>
            <p>Name: <?php echo htmlspecialchars($user['MemberFirstName'] . ' ' . $user['MemberLastName']); ?></p>
            <p>Email: <?php echo htmlspecialchars($user['Email']); ?></p>
            <p>Phone: <?php echo htmlspecialchars($user['MemberPhoneNumber']); ?></p>
            <p>Address: <?php echo htmlspecialchars($user['Address'] . ', ' . $user['City'] . ', ' . $user['State'] . ', ' . $user['Country'] . ', ' . $user['ZipCode']); ?></p>
        </div>
        <form name="form" method="post" action="bookingconfirm.php" onsubmit="return validateDates()">
            <div class="booking-info">
                <h2>Booking Details</h2>
                <label for="brand">Select Vehicle Brand:</label>
                <select id="brand" name="brand" onchange="showModels(this.value)" required>
                    <option value="">Select a brand</option>
                    <?php
                    $brands = mysqli_query($conn, "SELECT DISTINCT Brand FROM vehicle");
                    while ($brand = mysqli_fetch_assoc($brands)) {
                        echo '<option value="' . $brand['Brand'] . '">' . $brand['Brand'] . '</option>';
                    }
                    ?>
                </select>
                <div id="model_selection" class="vehicle-list">
                    <?php
                    $vehicles = mysqli_query($conn, "SELECT * FROM vehicle");
                    while ($vehicle = mysqli_fetch_assoc($vehicles)) {
                        echo '<div id="vehicle_' . $vehicle['Vehicle_ID'] . '" class="vehicle-card vehicle-models ' . $vehicle['Brand'] . '" style="display:none;" data-rate="' . $vehicle['PricePerHour'] . '" onclick="updateSelectedVehicle(' . $vehicle['Vehicle_ID'] . ')">';
                        echo '<img src="path_to_vehicle_images/' . $vehicle['Model'] . '.jpg" alt="' . $vehicle['Model'] . '">';
                        echo '<div class="details">';
                        echo '<p>Brand: ' . $vehicle['Brand'] . '</p>';
                        echo '<p>Model: ' . $vehicle['Model'] . '</p>';
                        echo '<p>Car Number: ' . $vehicle['CarNumber'] . '</p>';
                        echo '<p>Price per Hour: <span class="price">$' . $vehicle['PricePerHour'] . '</span></p>';
                        echo '<input type="hidden" name="vehicle_id" value="' . $vehicle['Vehicle_ID'] . '">';
                        echo '</div>';
                        echo '</div>';
                    }
                    ?>
                </div>
                <div>
                    <h3>Selected Vehicle Price: <span id="price_per_hour">$0.00 per hour</span></h3>
                </div>
                <label for="depart_location">Depart Location:</label>
                <select id="depart_location" name="depart_location" required>
                    <option value="1">Taipei Main Station, Taipei City</option>
                    <option value="2">Taichung Station, Taichung City</option>
                    <option value="3">Kaohsiung Station, Kaohsiung City</option>
                    <option value="4">Hsinchu Station, Hsinchu City</option>
                    <option value="5">Tainan Station, Tainan City</option>
                    <option value="6">Keelung Station, Keelung City</option>
                    <option value="7">Chiayi Station, Chiayi City</option>
                </select>
                <label for="depart_date">Depart Date:</label>
                <input type="date" id="depart_date" name="depart_date" required />
                <label for="depart_time">Time:</label>
                <input type="time" id="depart_time" name="depart_time" required />
                <label for="return_location">Return Location:</label>
                <select id="return_location" name="return_location" required>
                    <option value="1">Taipei Main Station, Taipei City</option>
                    <option value="2">Taichung Station, Taichung City</option>
                    <option value="3">Kaohsiung Station, Kaohsiung City</option>
                    <option value="4">Hsinchu Station, Hsinchu City</option>
                    <option value="5">Tainan Station, Tainan City</option>
                    <option value="6">Keelung Station, Keelung City</option>
                    <option value="7">Chiayi Station, Chiayi City</option>
                </select>
                <label for="return_date">Return Date:</label>
                <input type="date" id="return_date" name="return_date" required />
                <label for="return_time">Time:</label>
                <input type="time" id="return_time" name="return_time" required />
            </div>
            <div class="total-amount">
                Total Amount: <span id="total_amount">$0.00</span>
            </div>
            <div class="form-group">
                <label for="payment_method">Payment Method:</label>
                <select id="payment_method" name="payment_method" required>
                    <option value="credit_card">Credit Card</option>
                    <option value="line_pay">Line Pay</option>
                    <option value="remit">Remit</option>
                </select>
            </div>
            <input type="hidden" name="user_id" value="<?php echo htmlspecialchars($user['Member_ID']); ?>" />
            <input type="hidden" name="total_amount" id="hidden_total_amount" />
            <div class="form-group">
                <button type="submit" onclick="updateHiddenTotalAmount()">Confirm Booking</button>
            </div>
        </form>
        <form method="post" action="logout.php">
            <button type="submit">Logout</button>
        </form>
    </div>
    <script>
        function updateHiddenTotalAmount() {
            var totalAmount = document.getElementById("total_amount").innerText.replace('$', '');
            document.getElementById("hidden_total_amount").value = totalAmount;
        }
    </script>
</body>
</html>
