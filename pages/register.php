<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../assets/css/register.css" />
    <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon" />
    <title>Register</title>
  </head>
  <body>
    <main>
      <form action="" method="post" class="login_form">
        <h3 class="login_form-title">Register</h3>
        <div class="login_form-container">
          <div class="login_form-input-area">
            <label for="name">Your Name:</label>
            <input
              required
              class="login_form-input"
              type="text"
              name="name"
              id="name"
              placeholder="Name"
              autocomplete="off"
            />
          </div>

          <div class="login_form-input-area">
            <label for="surname">Your Surname:</label>
            <input
              required
              class="login_form-input"
              type="text"
              name="surname"
              id="surname"
              placeholder="surname"
            />
          </div>

          <div class="login_form-input-area">
            <label for="birthdate">Birthdate:</label>
            <input
              required
              class="login_form-input"
              type="date"
              name="birthdate"
              id="birthdate"
            />
          </div>
          <div class="login_form-input-area">
            <label for="tel">Telefon number:</label>
            <input
              required
              class="login_form-input"
              type="text"
              name="tel"
              id="tel"
              placeholder="Telefon number"
            />
          </div>

          <div class="login_form-input-area">
            <label for="email">Email:</label>
            <input
              required
              class="login_form-input"
              type="email"
              name="email"
              id="email"
              placeholder="Email"
            />
          </div>

          <!-- <div class="login_form-input-area">
            <label for="country">Country:</label>
            <input required
              class="login_form-input"
              type="text"
              name="country"
              id="country"
              placeholder="Country"
            />
          </div>

          <div class="login_form-input-area">
            <label for="city">City:</label>
            <input required
              class="login_form-input"
              type="text"
              name="city"
              id="city"
              placeholder="City"
            />
          </div>

          <div class="login_form-input-area">
            <label for="address">Street:</label>
            <input required
              type="text"
              name="street"
              id="street"
              placeholder="Street"
              class="login_form-input"
            />
          </div>
          <div class="login_form-input-area hous_num-area">
            <div class="login_form-input-area">
              <label for="hous_num">Hous Nr.:</label>
              <input required
                type="text"
                name="hous_num"
                id="hous_num"
                placeholder="Hous Number"
                class="login_form-input"
              />
            </div>

            <div class="login_form-input-area">
              <label for="postal_code">PLZ:</label>
              <input required
                class="login_form-input"
                type="text"
                name="postal_code"
                id="postal_code"
                placeholder="Postal Code"
              />
            </div>
          </div> -->

          <div class="login_form-input-area username_input-area">
            <label for="username">Username:</label>
            <input
              required
              class="login_form-input"
              type="text"
              name="username"
              id="username"
              placeholder="Username"
            />
          </div>

          <div class="login_form-input-area">
            <label for="password">Password:</label>
            <input
              required
              class="login_form-input"
              type="password"
              name="password"
              id="password"
              placeholder="************"
            />
          </div>

          <div class="login_form-input-area">
            <label for="confirmPass">Confirm Your Password:</label>
            <input
              required
              class="login_form-input"
              type="password"
              name="confirmPass"
              id="confirmPass"
              placeholder="************"
            />
          </div>
          <div class="Data_Protection">
            <input
              type="checkbox"
              name="Data_Protection"
              id="Data_Protection"
              required
            />
            <label for="Data_Protection"
              >Ich habe die
              <a href=""
                onclick="window.open('./Data_Explanation.html', 'Datenschutzerklärung', 'top=20,left=40,width=600,height=400,toolbar=no,scrollbars=yes')"
                class="data_explanation"
                >Datenschutzerklärung</a
              >
              gelesen und akzeptiere sie.</label
            >
          </div>
          <input class="login_form-submit" type="submit" value="Register" />
        </div>
      </form>
    </main>
  </body>
</html>
<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include("./connection.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Formdan gelen verileri al
    $name = $_POST["name"];
    $surname = $_POST["surname"];
    $birthdate = $_POST["birthdate"];
    $tel = $_POST["tel"];
    $email = $_POST["email"];
    $username = $_POST["username"];
    $password = $_POST["password"];
    $confirmPass = $_POST["confirmPass"];

    // Şifrelerin uyuşup uyuşmadığını kontrol et
    if ($password !== $confirmPass) {
        echo "Şifreler uyuşmuyor.";
        exit();
    }

    // Şifreyi hashleyerek güvenli hale getirin
    // $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Doğum tarihini MySQL tarih formatına dönüştür
    $mysql_date = date('Y-m-d', strtotime($birthdate));

    // Veritabanına kullanıcı bilgilerini ekleyin
    $sql_insert_kunde = "INSERT INTO Kunde (Vorname, Nachname, Geb_Datum) 
                         VALUES ('$name', '$surname', '$mysql_date')";
    
    if ($connection->query($sql_insert_kunde) === TRUE) {
        $new_kunde_nr = $connection->insert_id;

        // Kund_Login tablosuna kullanıcı giriş bilgilerini ekleyin
        $sql_insert_login = "INSERT INTO Kund_Login (Kund_Nr, kund_username, kund_pass) 
                             VALUES ($new_kunde_nr, '$username', '$password')";

        if ($connection->query($sql_insert_login) === TRUE) {
            // Knd_Kontakt tablosuna iletişim bilgilerini ekleyin
            $sql_insert_contact = "INSERT INTO Knd_Kontakt (Kund_Nr, TEL, EMAIL) 
                                  VALUES ($new_kunde_nr, '$tel', '$email')";

            if ($connection->query($sql_insert_contact) === TRUE) {
                echo "<script>alert('Registration successful!');
                location.href='./cust_login.php';</script>";
                exit();
            } else {
                echo "Error: " . $sql_insert_contact . "<br>" . $connection->error;
            }
        } else {
            echo "Error: " . $sql_insert_login . "<br>" . $connection->error;
        }
    } else {
        echo "Error: " . $sql_insert_kunde . "<br>" . $connection->error;
    }
}
?>
