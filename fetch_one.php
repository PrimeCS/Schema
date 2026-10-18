<?php
require 'dbconfig.php';

$stmt = $pdo->prepare("SELECT item_id, item_name, brand, unit_size, price
                       FROM grocery_items WHERE item_id = :id");
$stmt->execute([':id' => 1]);
$item = $stmt->fetch();   // one row

echo "<pre>";
print_r($item);
echo "</pre>";