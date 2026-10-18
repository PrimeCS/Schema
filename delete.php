<?php
require 'dbconfig.php';

// Remove the record added by insert
$stmt = $pdo->prepare("DELETE FROM grocery_items WHERE item_name = :name AND brand = :brand");
$stmt->execute([':name' => 'Agni Strong Chai', ':brand' => 'Tata Tea']);

echo "Rows deleted: " . $stmt->rowCount();