SELECT COUNT(*) AS customers_count FROM customers;
SELECT COUNT(*) AS products_count FROM products;
SELECT COUNT(*) AS orders_count FROM orders;
SELECT COUNT(*) AS order_items_count FROM order_items;
SELECT COUNT(*) AS returns_count FROM returns;
SELECT COUNT(*) AS inventory_count FROM inventory;
SELECT COUNT(*) AS shipments_counts FROM shipments;

#Over what time period do I actually have data? 
SELECT
	MIN(order_date) AS first_order,
    MAX(order_date) AS last_order
FROM orders;