<?php
include("./connection.php");
session_start();
if (!isset($_SESSION['user'])) {
    header("Location: panel_login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/admin_panel.css" type="text/css">
    <link rel="shortcut icon" href="./assets/images/favicon.png" type="image/x-icon" />
    <title>Panel</title>
</head>

<body>
    <main>
        <div class="toolbar-container">
            <ul class="menu">
                <li class="active menu-item"><a href="../pages/panel.php"><i class="fa-solid fa-carrot" style="color: #fdfdfd;"></i>Zutaten</a></li>
                <li class="menu-item"><a href="../pages/admin_recipes.php"><i class="fa-solid fa-receipt" style="color: #fdfdfd;"></i>Rezepte</a></li>
                <li class="menu-item"><a href="../pages/admin_kunde.php"><i class="fa-solid fa-user" style="color: #fdfdfd;"></i></i>Kunde</a></li>
                <li class="menu-item"><a href="../pages/logout.php"><i class="fa-solid fa-arrow-right-from-bracket "style="color: #fdfdfd;"></i>Logout</a></li>
            </ul>
        </div>
        <section class="overview_container">
            <div class="overview_item">
                <div class="controls">
                    <button class="add_statement_btn" name="Select">Select</button>
                    <button class="add_statement_btn" name="Update">Update</button>
                    <button class="add_statement_btn" name="Add">Add</button>
                    <button class="add_statement_btn" name="ChooseNotUsed">Choose not used in any recipe</button>
                    <button class="add_statement_btn" name="ChooseNeverSold">Choose never sold</button>
                    <button type="submit" class="add_statement_btn" name="Delete">Delete</button>
                </div>
                <form method="GET" class="statement_form">

                    <textarea placeholder="Enter your SQL statement" name="statement" class="sql_statements" spellcheck="false"></textarea>
                    <input class="run_button" type="submit" value="Run">

                    <?php
                        if (isset($_GET['statement']) && !empty($_GET['statement'])) {
                            $sql = $_GET['statement'];

                            $result = mysqli_query($connection, $sql);
                            if ($result) {
                                echo "<script>alert('Statement executed successfully.')</script>";
                            } else {
                                echo "<script>alert('Statement execution failed.')</script>"; 
                            }

                        }
                    ?>

                </form>
                <div class="table_container">
                    <table class="result_table">
                        <tr class="result_table-title-row">
                            <th class="result_table-title">Zutat ID</th>
                            <th class="result_table-title">Zutat Bez</th>
                            <th class="result_table-title">Einheit</th>
                            <th class="result_table-title">Netto Preis</th>
                            <th class="result_table-title">Bestand</th>
                            <th class="result_table-title">Img Link</th>
                        </tr>
                        <?php
                        $sql = "SELECT * FROM Zutat";
                        if (isset($_GET['statement']) && !empty($_GET['statement'])) {
                            $sql = $_GET['statement'];
                        }

                        $result = mysqli_query($connection, $sql);
                        if ($result) {
                            while ($row = mysqli_fetch_assoc($result)) {
                                echo '';
                                echo '<tr class="result_table-result-row">
                            <td class="result_table-result">' . $row['Zutat_ID'] . '</td>
                            <td class="result_table-result">' . $row['Zutat_Bez'] . '</td>
                            <td class="result_table-result">' . $row['Einheit'] . '</td>
                            <td class="result_table-result">' . $row['Netto_Preis'] . '</td>
                            <td class="result_table-result">' . $row['Bestand'] . '</td>
                            <td class="result_table-result">'.$row['Img_Link'].'</td>
                        </tr>';
                            }
                        } else {
                            echo "<p class='error'>veri bulunamadi.</p>";
                        }
                        mysqli_close($connection);
                        ?>

                    </table>
                </div>
            </div>


        </section>

    </main>
    <script src="../assets/js/panel_ingredients.js" type="text/javascript"></script>
</body>

</html>