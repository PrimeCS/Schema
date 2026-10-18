<?php
require 'dbconfig.php';

$rows = $pdo->query("SELECT g.item_id, g.item_name, g.brand, c.category_name, g.unit_size, g.price, g.stock_quantity
                     FROM grocery_items g
                     JOIN categories c ON c.category_id = g.category_id
                     ORDER BY c.category_name, g.brand")->fetchAll();
?>
<!DOCTYPE html>
<html>
<head><title>Grocery Items</title></head>
<body>
    <h2>Grocery Items (India)</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID</th><th>Item</th><th>Brand</th><th>Category</th>
            <th>Size</th><th>Price (INR)</th><th>Stock</th>
        </tr>
        <?php foreach ($rows as $row): ?>
        <tr>
            <td><?= $row['item_id'] ?></td>
            <td><?= htmlspecialchars($row['item_name']) ?></td>
            <td><?= htmlspecialchars($row['brand']) ?></td>
            <td><?= htmlspecialchars($row['category_name']) ?></td>
            <td><?= htmlspecialchars($row['unit_size']) ?></td>
            <td><?= number_format($row['price'], 2) ?></td>
            <td><?= $row['stock_quantity'] ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>