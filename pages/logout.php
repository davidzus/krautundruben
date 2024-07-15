<?php
session_start();
session_unset();
session_destroy();
echo "<script>alert('Logout successful.');
location.href = '../index.php';</script>";
exit();
?>