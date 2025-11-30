#Return Rate by category
 SELECT
    ca.category_name,
    COUNT(r.return_id) AS returns_count,
    COUNT(oi.order_item_id) AS total_items,
    (COUNT(r.return_id) / COUNT(oi.order_item_id)) * 100 AS return_rate_percent
FROM categories ca
JOIN products p ON ca.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN returns r ON oi.order_item_id = r.order_item_id
GROUP BY ca.category_name
ORDER BY return_rate_percent DESC;