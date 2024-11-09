<!-- register.php -->
<?php 
include("mysql_connect.inc.php"); 
?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<form name="form" method="post" action="register_finish.php">
    First Name: <input type="text" name="first_name" /> <br>
    Last Name: <input type="text" name="last_name" /> <br>
    Email: <input type="text" name="email" /> <br>
    Password: <input type="password" name="password" /> <br>
    Confirm Password: <input type="password" name="password2" /> <br>
    Phone: <input type="text" name="phone" /> <br>
    Address: <input type="text" name="address" /> <br>
    <input type="submit" name="button" value="Register" />
</form>
