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
      <h3 class="login_form-title">Login</h3>
      <div class="login_form-container">

        <div class="login_form-input-area">
          <i class="fa-solid fa-user"></i>
          <input class="login_form-input-area login_form-input" type="text" name="username" id="username" placeholder="Username" autocomplete="off" />
        </div>

        <div class="login_form-input-area">
          <i class="fa-solid fa-lock"></i>
          <input class="login_form-input" type="password" name="password" id="password" placeholder="************" />
        </div>
        <div class="form_links">
          <a href="./register.php" class="login_form-register">Register</a>
          <a href="" class="reset_pass">Reset Password</a>
        </div>


        <input class="login_form-submit" type="submit" value="Login" />
      </div>
    </form>
  </main>
</body>

</html>
<?php
session_start();

// Eğer kullanıcı zaten giriş yaptıysa ana sayfaya yönlendir
if (isset($_SESSION['customer'])) {
    echo "<script>
    alert('You are already logged in.');location.href = '../index.php';</script>";
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include("./connection.php");

    $cust_username = $_POST['username'];
    $cust_password = $_POST['password'];

    if (!empty($cust_username) && !empty($cust_password)) {
        // Kullanıcı adı ve şifreyi temizle
        $cust_username = $connection->real_escape_string($cust_username);
        $cust_password = $connection->real_escape_string($cust_password);

        // SQL sorgusu
        $sql = "SELECT * FROM Kund_Login WHERE kund_username='$cust_username' AND kund_pass='$cust_password'";
        $result = $connection->query($sql);

        // SQL sorgusunun sonucunu kontrol et
        if ($result && $result->num_rows > 0) {
          // Giriş başarılı, kullanıcı bilgilerini sakla
          $row = $result->fetch_assoc();
          $_SESSION['customer'] = $cust_username;
          $_SESSION['customer_id'] = $row['kund_Nr'];

          echo "<script>
          alert('Login successful. Welcome back, " . $cust_username . "!');
          location.href = '../index.php';
          </script>";
          exit();
        } else {
            // Giriş başarısız
            echo "<script>alert('Login failed. Invalid username or password.');
            location.href = './cust_login.php';</script>";
            exit();
        }
    } else {
        // Kullanıcı adı veya şifre boşsa
        echo "<script>alert('Please enter both username and password.');</script>";
        exit();
    }
}
?>