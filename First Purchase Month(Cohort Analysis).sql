WITH first_purchase AS (
    SELECT 
        CustomerID,
        TO_CHAR(MIN(Date_Only), 'YYYY-MM') AS cohort_month
    FROM online_retail1
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
),
customer_orders AS (
    SELECT 
        o.CustomerID,
        f.cohort_month,
        COUNT(DISTINCT o.InvoiceNo) AS total_orders
    FROM online_retail1 o
    INNER JOIN first_purchase f ON o.CustomerID = f.CustomerID
    GROUP BY o.CustomerID, f.cohort_month
)
SELECT 
    cohort_month,
    COUNT(*) AS new_customers,
    SUM(CASE WHEN total_orders = 1 THEN 1 ELSE 0 END) AS one_time_buyers,
    SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) AS repeat_buyers,
    ROUND(100.0 * SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS repeat_rate
FROM customer_orders
GROUP BY cohort_month
ORDER BY cohort_month;