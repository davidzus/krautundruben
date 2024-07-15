<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="./assets/css/style.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
  <link rel="shortcut icon" href="./assets/images/favicon.png" type="image/x-icon" />
  <title>Kraut und Rüben</title>
</head>

<body>
  <main>
    <header>
      <menu>
        <ul>
          <li><a href="#home" class="menu_item">Home</a></li>
          <li><a href="#products" class="menu_item">Products</a></li>
          <li><a href="#contact" class="menu_item">Contact Us</a></li>
        </ul>
        <ul class="menu_controls">
          <li>
            <a href="#" class="menu_item shopping_cart">
              <div class="product_count">2</div>
              <img src="./assets/images/cart-shopping.svg" alt="shopping-cart-ico">
            </a>
          </li>
          <?php if (isset($_SESSION['customer'])) : ?>
            <li class="menu_item logout"><a href="./pages/logout.php">Logout</a></li>
            <li><a class="menu_item">
                <?php echo $_SESSION['customer']; ?></a></li>
            <li><a href="./pages/delete_cust.php" class="menu_item">Delete Account</a></li>
          <?php else : ?>
            <li class="menu_item login">
              <a href="./pages/cust_login.php">Login</a>
            </li>
          <?php endif; ?>
        </ul>
      </menu>
    </header>
    <div class="shopping_cart-toolbar">
      <div class="toolbar_close">
        <span class="toolbar_close-btn">></span>
      </div>
      <div class="card_title">Orders</div>
      <div class="cart_items">
        <div class="item_img">
          <img src="./assets/images/fuits-card.jpg" alt="Test_Image">
        </div>
        <div class="item_Details">
          <div class="item_title">Test Item</div>
          <div class="item_description">Test Description</div>
        </div>
        <div class="item_price">12.99 Euro</div>
      </div>
      <div class="price_summary">12.99 Euro</div>
    </div>
    <a id="home"></a>
    <section class="hero">
      <div class="headline">Kraut und Rüben</div>
      <div class="headline_sub">
        Fresh Organic Produce Delivered to Your Door.
      </div>
      <div class="CTA_title">Let's Order</div>
      <div class="CTA_items">
        <a href="./pages/recipes.php">
          <div class="CTA_item ctg_receipes">
            <div class="CTA_text">Recipes</div>
          </div>
        </a>
        <a href="./pages/ingredients.php">
          <div class="CTA_item ctg_materials">
            <div class="CTA_text">Ingredients</div>
          </div>
        </a>
      </div>
    </section>

    <a id="products"></a>
    <section class="products">
      <div class="products_title">Our Products</div>
      <div class="product_items">
        <div class="swiper mySwiper">
          <div class="swiper-wrapper">

            <?php
            error_reporting(E_ALL);
            ini_set('display_errors', 1);
            include("./pages/connection.php");
            $sql = "SELECT Rez_Bez, Img_Link FROM Rezepte";
            $result = $connection->query($sql);
            if ($result->num_rows > 0) {
              while ($row = $result->fetch_assoc()) {
                echo "
              <div class='swiper-slide'>
              <img src='" . $row['Img_Link'] . "' alt='" . $row['Rez_Bez'] . "' lading='lazy'/>
            </div>
              ";
              }
            }
            ?>

          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-pagination"></div>
          <!-- <div class="autoplay-progress">
                <svg viewBox="0 0 48 48">
                  <circle cx="24" cy="24" r="20"></circle>
                </svg>
                <span></span>
              </div>
            </div> -->
        </div>
      </div>
    </section>
    <a id="contact"></a>
    <section class="contact">
      <form class="contact_form" action="index.php" method="post">
        <h3 class="form_title">Contact Us</h3>
        <div class="form_container">
          <div class="form_name">
            <label class="input_label" for="name">Name:</label>
            <input class="form_input" type="text" name="name" id="name" autocomplete="off" />
          </div>

          <div class="form_email">
            <label class="input_label" for="email">Email:</label>
            <input class="form_input" type="email" name="email" id="email" />
          </div>

          <div class="form_textarea">
            <label class="input_label" for="contact_msg">Your Message:</label>
            <textarea class="form_msg" name="contact_msg" cols="30" rows="10"></textarea>
          </div>
        </div>
        <input class="form_button" type="submit" value="Send Message" />
      </form>
    </section>
    <footer></footer>
  </main>
  <script src="./assets/js/script.js"></script>
  <script src="./assets/js/slider.js" type="module"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</body>

</html>


<?php exit(); ?>