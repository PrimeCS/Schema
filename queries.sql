USE grocery_db;

-- Item count and average price per category (JOIN + GROUP BY)
SELECT c.category_name, COUNT(*) AS total_items, ROUND(AVG(g.price), 2) AS avg_price
FROM grocery_items g
JOIN categories c ON c.category_id = g.category_id
GROUP BY c.category_id, c.category_name
ORDER BY avg_price DESC;

-- Brands with 2 or more products (HAVING)
SELECT brand, COUNT(*) AS product_count
FROM grocery_items
GROUP BY brand
HAVING COUNT(*) >= 2;

-- Items priced above their category average (correlated subquery)
SELECT item_name, brand, price
FROM grocery_items g
WHERE price > (SELECT AVG(price) FROM grocery_items WHERE category_id = g.category_id);

-- Most expensive item per category (CTE + window function)
WITH ranked AS (
    SELECT c.category_name, g.item_name, g.price,
           RANK() OVER (PARTITION BY g.category_id ORDER BY g.price DESC) AS price_rank
    FROM grocery_items g
    JOIN categories c ON c.category_id = g.category_id
)
SELECT * FROM ranked WHERE price_rank = 1;