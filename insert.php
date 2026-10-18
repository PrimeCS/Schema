<?php
require 'dbconfig.php';

$stmt = $pdo->prepare("INSERT INTO grocery_items (item_name, brand, category_id, unit_size, price, stock_quantity)
                       VALUES (:item_name, :brand, :category_id, :unit_size, :price, :stock)");
$stmt->execute([
    ':item_name'   => 'Agni Strong Chai',
    ':brand'       => 'Tata Tea',
    ':category_id' => 7,
    ':unit_size'   => '250 g',
    ':price'       => 140.00,
    ':stock'       => 60,
]);

echo "Inserted. New item_id: " . $pdo->lastInsertId();