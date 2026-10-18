<?php
require 'dbconfig.php';

// Changess
$stmt = $pdo->prepare("UPDATE grocery_items SET price = :price, stock_quantity = :stock
                       WHERE item_id = :id");
$stmt->execute([':price' => 700.00, ':stock' => 45, ':id' => 1]);

echo "Rows updated: " . $stmt->rowCount();