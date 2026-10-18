<?php
require 'dbconfig.php';

$stmt = $pdo->query("SELECT item_id, item_name, brand, price FROM grocery_items LIMIT 5");
$items = $stmt->fetchAll();   // all rows at once

echo "<pre>";
print_r($items);
echo "</pre>";