<?php
$db_server="sql310.infinityfree.com";
$db_user="if0_36861027";
$db_pass="team12project";
$db_name="if0_36861027_krautundruebenDB";

$connection = mysqli_connect($db_server, $db_user, $db_pass, $db_name);

if (!$connection) {
    die("DB Connection Failed.".mysqli_connect_error());
}
$connection->set_charset("utf8mb4");
?>