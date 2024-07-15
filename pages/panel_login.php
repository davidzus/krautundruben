<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="../assets/css/style_login.css" />
  <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon" />
  <title>Login</title>
</head>

<body>
  <main>
    <form action="" method="post" class="login_form">
      <h3 class="login_form-title">Admin Login</h3>
      <div class="login_form-container">

        <div class="login_form-input-area">
          <i class="fa-solid fa-user"></i>
          <input class="login_form-input-area login_form-input" type="text" name="username" id="username" placeholder="Username" autocomplete="off" />
        </div>

        <div class="login_form-input-area">
          <i class="fa-solid fa-lock"></i>
          <input class="login_form-input" type="password" name="password" id="password" placeholder="************" />
        </div>

        <input class="login_form-submit" type="submit" value="Login" />
      </div>
    </form>
  </main>
</body>

</html>
<?php
session_start();


$Admin_Username = "admin";
$Admin_Password = "team12";

if (isset($_SESSION['user'])) {
  echo "<script>alert('You are already logged in. ');</script>";
  header('location:panel.php');
}


if (isset($_POST['username']) && isset($_POST['password'])) {
  $username = $_POST['username'];
  $password = $_POST['password'];
  if ($username == $Admin_Username && $password == $Admin_Password) {
    $_SESSION["user"] = $Admin_Username;
    header("Location: panel.php");
  } else {
    echo "Wrong username or password";
  }
}

?>