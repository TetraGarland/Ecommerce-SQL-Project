#Average delivery time by carrier
SELECT 
    s.carrier,
    AVG(DATEDIFF(s.delivered_date, s.shipped_date)) AS avg_delivery_days
FROM shipments s
GROUP BY s.carrier
ORDER BY avg_delivery_days;