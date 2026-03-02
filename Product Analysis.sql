WITH repeat_customers AS (
    SELECT CustomerID
    FROM online_retail1
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
    HAVING COUNT(DISTINCT InvoiceNo) > 1
)
SELECT 
    Description,
    COUNT(DISTINCT o.CustomerID) AS repeat_customer_count,
    SUM(Quantity) AS total_quantity_sold,
    ROUND(SUM(Revenue)::NUMERIC, 2) AS total_revenue
FROM online_retail1 o
INNER JOIN repeat_customers r ON o.CustomerID = r.CustomerID
WHERE Description IS NOT NULL
    AND Revenue > 0
GROUP BY Description
ORDER BY repeat_customer_count DESC
LIMIT 20;