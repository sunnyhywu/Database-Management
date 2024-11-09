<!-- 設定網頁編碼為UTF-8 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<?php
include '../connect.php';
session_start();
//destroy the session
session_unset();
//redirect to login page
header("location: member.php");
?>