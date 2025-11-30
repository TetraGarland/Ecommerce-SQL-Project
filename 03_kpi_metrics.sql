#Total revenue, total orders, total customers
SELECT 
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id;