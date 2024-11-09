<?php
session_start();
include("mysql_connect.inc.php");
?>

<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="styles.css">
<html>
<head>
    <meta charset="utf-8">
    <title>Car Rental System</title>
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
        <h1>Car Rental System</h1>
        <div id="login">
            <h2>Login</h2>
            <form method="post" action="connect.php">
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="email" required>
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" required>
                </div>
                <div class="form-group">
                    <button type="submit">Login</button>
                </div>
            </form>
        </div>

        <div id="register">
            <h2>Register</h2>
            <form method="post" action="register_finish.php">
                <div class="form-group">
                    <label>First Name:</label>
                    <input type="text" name="first_name" required>
                </div>
                <div class="form-group">
                    <label>Last Name:</label>
                    <input type="text" name="last_name" required>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="email" required>
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" required>
                </div>
                <div class="form-group">
                    <label>Confirm Password:</label>
                    <input type="password" name="password2" required>
                </div>
                <div class="form-group">
                    <label>Phone Number:</label>
                    <input type="text" name="phone" required>
                </div>
                <div class="form-group">
                    <label>Address:</label>
                    <input type="text" name="address" required>
                </div>
                <div class="form-group">
                    <label>City:</label>
                    <input type="text" name="city" required>
                </div>
                <div class="form-group">
                    <label>State:</label>
                    <input type="text" name="state" required>
                </div>
                <div class="form-group">
                    <label>Country:</label>
                    <input type="text" name="country" required>
                </div>
                <div class="form-group">
                    <label>Zip Code:</label>
                    <input type="text" name="zipcode" required>
                </div>
                <div class="form-group">
                    <button type="submit">Register</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
