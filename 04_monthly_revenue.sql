#Monthly Revenue
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS yearmonth,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY yearmonth
ORDER BY yearmonth;