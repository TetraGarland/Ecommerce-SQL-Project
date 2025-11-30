#Category performance
SELECT 
    ca.category_name,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM categories ca
JOIN products p ON ca.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY ca.category_name
ORDER BY revenue DESC;