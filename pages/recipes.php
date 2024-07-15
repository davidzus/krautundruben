<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
include("./connection.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon" />
  <link rel="stylesheet" href="../assets/css/style.css" />
  <title>Kraut und Rüben</title>
</head>

<body>
  <header>
    <menu>
      <ul>
        <li><a href="https://krautundruben.000.pe" class="menu_item">Home</a></li>
        <li><a href="https://krautundruben.000.pe/#products" class="menu_item">Products</a></li>
        <li><a href="https://krautundruben.000.pe/#contact" class="menu_item">Contact Us</a></li>
      </ul>
      <ul class="menu_controls">
        <li>
          <a href="#" class="menu_item shopping_cart">
            <div class="product_count">2</div>
            <img src="../assets/images/cart-shopping.svg" alt="shopping-cart-ico" />
          </a>
        </li>
        <?php if (isset($_SESSION['customer'])) : ?>
          <li class="menu_item logout">
            <a href="./logout.php">Logout</a>
          </li>
          <li>
            <a class="menu_item">
              <?php echo $_SESSION['customer']; ?></a>
          </li>
          <li><a href="./pages/delete_cust.php" class="menu_item">Delete Account</a></li>
        <?php else : ?>
          <li class="menu_item login">
            <a href="../pages/cust_login.php">Login</a>
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
        <img src="../assets/images/fuits-card.jpg" alt="Test_Image" />
      </div>
      <div class="item_Details">
        <div class="item_title">Test Item</div>
        <div class="item_description">Test Description</div>
      </div>
      <div class="item_controls">
        <button class="del_cart-btn">X</button>
        <div class="item_price">12.99 &#8364;</div>
      </div>
    </div>
    <div class="price_summary">12.99 &#8364;</div>
  </div>
  <a id="home"></a>
  <section class="hero">
    <div class="headline">Kraut und Rüben</div>
    <div class="headline_sub">
      Fresh Organic Produce Delivered to Your Door.
    </div>
    <div class="CTA_title">Let's Order</div>
    <div class="CTA_items">
      <div class="CTA_items">
        <a href="../pages/recipes.php">
          <div class="CTA_item ctg_receipes">
            <div class="CTA_text">Rezepte</div>
          </div>
        </a>
        <a href="../pages/ingredients.php">
          <div class="CTA_item ctg_materials">
            <div class="CTA_text">Zutaten</div>
          </div>
        </a>
      </div>
    </div>
  </section>
  <a id="products_list"></a>
  <section class="product_list">
    <form method="GET" class="product_filter">
      <div class="filter-search">
        <input id="search" name="search" type="text" placeholder="Search..." autocomplete="off" />
        <button type="submit" id="search_btn"><i class="fa fa-search"></i></button>
      </div>
      <div class="filter">
        <div class="filter-title filter-ingredients-title">
          <span class="filter-title-icon">
            < </span> Zutaten
        </div>
        <div class="filter-options filter-opt-ingredients">
          <?php
          $sql = "SELECT * FROM Zutat";
          $result = $connection->query($sql);
          if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
              echo '<div class="filter-option">
                <input type="checkbox" name="ingredients[]" value="' . $row['Zutat_ID'] . '" class="allergen" />
                <label for="' . $row['Zutat_Bez'] . '" class="allergen_label">ohne ' . $row['Zutat_Bez'] . '</label>
                </div>';
            }
          }
          ?>
        </div>
      </div>
      <div class="filter">
        <div class="filter-title filter_allergens-title">
          <span class="filter-title-icon">
            < </span> Allergene
        </div>
        <div class="filter-options filter-opt-allergens">
          <?php
          $sql = "SELECT * FROM Allergene";
          $result = $connection->query($sql);
          if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
              echo '<div class="filter-option">
                <input type="checkbox" name="allergens[]" value="' . $row['Allerg_ID'] . '" class="allergen" />
                <label for="' . $row['Allerg_Bez'] . '" class="allergen_label">' . $row['Allerg_Bez'] . '</label>
                </div>';
            }
          }
          ?>

        </div>
      </div>

      <input class="filter_button" type="submit" value="Filter" />
    </form>

    <div class="product_container">
      <p class="product_result_count"></p>

      <?php
      error_reporting(E_ALL);
      ini_set('display_errors', 1);
      include("./connection.php");

      // $sql = "SELECT Rezepte.Rez_Bez, Rezepte.Rez_Besch, Rezepte.Rez_Preis, Rezepte.Img_Link, IFNULL(Bes_Rez.Menge, 0) AS menge 
      // FROM Rezepte
      // LEFT JOIN Bes_Rez ON Rezepte.Rez_ID = Bes_Rez.Rez_ID
      // LEFT JOIN Rez_Zutat ON Rezepte.Rez_ID = Rez_Zutat.Rez_ID";
      $sql = "SELECT Rezepte.Rez_Bez, Rezepte.Rez_Besch, Rezepte.Rez_Preis, Rezepte.Img_Link, IFNULL(Bes_Rez.Menge, 0) AS menge 
        FROM Rezepte
        LEFT JOIN Bes_Rez ON Rezepte.Rez_ID = Bes_Rez.Rez_ID
        LEFT JOIN Rez_Zutat ON Rezepte.Rez_ID = Rez_Zutat.Rez_ID
        LEFT JOIN Zutat ON Rez_Zutat.Zutat_ID = Zutat.Zutat_ID
        LEFT JOIN Zutat_Allerg ON Zutat.Zutat_ID = Zutat_Allerg.Zutat_ID";
      $allergens_placeholder = "";
      $ingredients_placeholder = "";
      $types = "";
      $params = [];



      // If allergens[] selected
      if (isset($_GET['allergens']) && !empty($_GET['allergens'])) {
        $selected_allergens = $_GET['allergens'];
        $placeholders = implode(",", array_fill(0, count($selected_allergens), '?'));
        $sql .= " WHERE Rezepte.Rez_ID NOT IN (
          SELECT Rezepte.Rez_ID
          FROM Rezepte
          LEFT JOIN Rez_Zutat ON Rezepte.Rez_ID = Rez_Zutat.Rez_ID
          LEFT JOIN Zutat ON Rez_Zutat.Zutat_ID = Zutat.Zutat_ID
          LEFT JOIN Zutat_Allerg ON Zutat.Zutat_ID = Zutat_Allerg.Zutat_ID 
          WHERE Zutat_Allerg.Allerg_ID IN ($placeholders)
        )";
        $types .= str_repeat('i', count($selected_allergens));
        $params = array_merge($params, $selected_allergens);
      }

      //if ingredients[] selected
      if (isset($_GET['ingredients']) && !empty($_GET['ingredients'])) {
        $selected_ingredients = $_GET['ingredients'];
        $placeholders = implode(",", array_fill(0, count($selected_ingredients), '?'));
        if (isset($_GET['allergens']) && !empty($_GET['allergens'])) {
          $sql .= " AND";
        } else {
          $sql .= " WHERE";
        }

        $sql .= " Rezepte.Rez_ID NOT IN (
                SELECT Rezepte.Rez_ID
                FROM Rezepte
                LEFT JOIN Rez_Zutat ON Rezepte.Rez_ID = Rez_Zutat.Rez_ID
                WHERE Rez_Zutat.Zutat_ID IN ($placeholders)
              )";
        $types .= str_repeat('i', count($selected_ingredients));
        $params = array_merge($params, $selected_ingredients);
      }

      // if search query
      if (isset($_GET['search']) && !empty($_GET['search'])) {
        $search = $_GET['search'];

        if (isset($_GET['ingredients']) && !empty($_GET['ingredients']) || isset($_GET['allergens']) && !empty($_GET['allergens'])) {
          $sql .= " AND";
        } else {
          $sql .= " WHERE";
        }

        $sql .= " (LOCATE('" . $search . "' ,Rezepte.Rez_Bez) > 0 OR LOCATE('" . $search . "' ,Rezepte.Rez_Besch) > 0)";
        // $types .= "s";
        // $params[] = '%' . $search . '%';
      }




      $sql .= " GROUP BY Rezepte.Rez_ID";
      // echo $sql; // Debugging 

      // Prepare statement
      $stmt = $connection->prepare($sql);
      if ($stmt === false) {
        die('Error preparing statement: ' . $connection->error);
      }

      // Bind parameters
      if (!empty($params)) {
        $stmt->bind_param($types, ...$params);
      }

      // Execute statement
      $result = $stmt->execute();
      if ($result === false) {
        die('Error executing statement: ' . $stmt->error);
      }

      // Get results
      $result = $stmt->get_result();


      if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
          echo '<div class="product_item">
                  <div class="product_item-img">
                    <img src="' . $row['Img_Link'] . '" alt="' . $row['Rez_Bez'] . '" loading="lazy"/>
                  </div>
                  <div class="product_item-details">
                    <div class="product_item-title">' . $row['Rez_Bez'] . '</div>
                    <div class="product_item-description">' . $row['Rez_Besch'] . '</div>
                  </div>
                  <div class="product_item-checkout">
                    <div class="product_item-checkout-price">' . $row['Rez_Preis'] . ' &#8364;</div>
                    <div class="product_order_count">&#x1F55B; Ordered ' . $row["menge"] . ' times
                    </div> 
                    <button class="add_cart-btn">+ Add To Cart</button>
                  </div>
                </div>';
        }
      } else {
        echo '<p style="text-align: center;font-size:1rem;">No results found</p>';
      }

      $stmt->close();
      $connection->close();





      // $sql = "SELECT Rezepte.Rez_Bez, Rezepte.Rez_Besch, Rezepte.Rez_Preis, Rezepte.Img_Link, IFNULL(Bes_Rez.Menge, 0) AS menge 
      //   FROM Rezepte
      //   LEFT JOIN Bes_Rez ON Rezepte.Rez_ID = Bes_Rez.Rez_ID
      //   LEFT JOIN Rez_Zutat ON Rezepte.Rez_ID = Rez_Zutat.Rez_ID";

      // // Eğer ingredients[] seçili ise
      // if (isset($_GET['ingredients']) && !empty($_GET['ingredients'])) {
      //   $selected_ingredients = $_GET['ingredients'];
      //   $placeholders = implode(",", array_fill(0, count($selected_ingredients), '?'));
      //   $sql .= " WHERE Rez_Zutat.Zutat_ID NOT IN ($placeholders)";
      // }

      // $sql .= " GROUP BY Rezepte.Rez_ID";
      // $result = $connection->query($sql);

      // if ($result->num_rows > 0) {
      //   while ($row = $result->fetch_assoc()) {
      //     echo '<div class="product_item">
      //       <div class="product_item-img">
      //         <img src="' . $row['Img_Link'] . '" alt="' . $row['Rez_Bez'] . '" loading="lazy"/>
      //       </div>
      //       <div class="product_item-details">
      //         <div class="product_item-title">' . $row['Rez_Bez'] . '</div>
      //         <div class="product_item-description">' . $row['Rez_Besch'] . '</div>
      //       </div>
      //       <div class="product_item-checkout">
      //         <div class="product_item-checkout-price">' . $row['Rez_Preis'] . ' &#8364;</div>
      //         <div class="product_order_count">&#x1F55B; Ordered ' . $row["menge"] . ' times
      //         </div> 
      //         <button class="add_cart-btn">+ Add To Cart</button>
      //       </div>
      //     </div>';
      //   }
      // } else {
      //   echo "No results found";
      // }

      // $connection->close();




      // $sql = "SELECT Rez_Bez,Rez_Besch,Rez_Preis,Img_Link, ifnull(menge,0) from Rezepte
      // LEFT JOIN Bes_Rez ON Rezepte.Rez_ID = Bes_Rez.Rez_ID
      // LEFT JOIN Bestellung on Bestellung.Bes_Nr = Bes_Rez.Bes_Nr
      // GROUP BY Rezepte.Rez_ID;";
      // $result = $connection->query($sql);

      // if ($result->num_rows > 0) {

      //   while ($row = $result->fetch_assoc()) {

      //     echo '<div class="product_item">
      //       <div class="product_item-img">
      //         <img src="' . $row['Img_Link'] . '" alt="' . $row['Rez_Bez'] . '" loading="lazy"/>
      //       </div>
      //       <div class="product_item-details">
      //         <div class="product_item-title">' . $row['Rez_Bez'] . '</div>
      //         <div class="product_item-description">' . $row['Rez_Besch'] . '</div>
      //       </div>
      //       <div class="product_item-checkout">
      //         <div class="product_item-checkout-price">' . $row['Rez_Preis'] . ' &#8364;</div>
      //         <div class="product_order_count">&#x1F55B; Ordered '.$row["ifnull(menge,0)"].' times
      //         </div> 
      //         <button class="add_cart-btn">+ Add To Cart</button>
      //       </div>
      //     </div>';
      //   }
      // }
      ?>

    </div>
  </section>
  <script src="../assets/js/filter_page.js"></script>
  <script src="../assets/js/script.js"></script>
</body>

</html>