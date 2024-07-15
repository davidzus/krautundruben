<?php
session_start();

// GET parametresi kontrolü yapılıyor
if (!isset($_SESSION['customer_id']) || empty($_SESSION['customer_id'])) {
    echo "<script>alert('Customer ID is missing.'); location.href = '../index.php';</script>";
    exit();
}

// Customer ID güvenli bir şekilde alınıyor
$Cust_ID = intval($_SESSION['customer_id']); // Güvenlik için intval kullanıyoruz

include("./connection.php");

// Prepared statement ile SQL sorgusu hazırlanıyor
$sql = "DELETE FROM Kund_Login WHERE kund_Nr = ?";
$stmt = $connection->prepare($sql);

if ($stmt) {
    // Parametre bağlama işlemi yapılıyor
    $stmt->bind_param("i", $Cust_ID);

    // Sorguyu çalıştır
    $stmt->execute();

    // Sorgu başarılı ise diğer tabloları da sil
    if ($stmt->affected_rows > 0) {
        // Kund_Adr tablosundan sil
        $sql_adr = "DELETE FROM Knd_Adr WHERE Kund_Nr = ?";
        $stmt_adr = $connection->prepare($sql_adr);
        if ($stmt_adr) {
            $stmt_adr->bind_param("i", $Cust_ID);
            $stmt_adr->execute();
        }
        // Kunde tablosundan sil
        $sql_kunde = "DELETE FROM Kunde WHERE Kund_Nr = ?";
        $stmt_kunde = $connection->prepare($sql_kunde);
        if ($stmt_kunde) {
            $stmt_kunde->bind_param("i", $Cust_ID);
            $stmt_kunde->execute();
        }

        // Bestellung tablosundan sil
        $sql_best = "DELETE FROM Bestellung WHERE Kund_Nr = ?";
        $stmt_best = $connection->prepare($sql_best);
        if ($stmt_best) {
            $stmt_best->bind_param("i", $Cust_ID);
            $stmt_best->execute();
        }


        // Oturumu temizle ve yok et
        session_unset();
        session_destroy();

        echo "<script>alert('Record deleted successfully!'); location.href = '../index.php';</script>";
    } else {
        echo "Error deleting record: " . $stmt->error;
    }

    // Bağlantı ve statementleri kapat
    $stmt->close();
    if (isset($stmt_adr)) $stmt_adr->close();
    if (isset($stmt_best)) $stmt_best->close();
} else {
    echo "Error preparing statement: " . $connection->error;
}

// Bağlantıyı kapat
$connection->close();
exit();
