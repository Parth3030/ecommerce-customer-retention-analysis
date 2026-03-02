WITH rfm_calc AS (
    SELECT 
        CustomerID,
        MAX(Date_Only) AS last_purchase_date,
        COUNT(DISTINCT InvoiceNo) AS frequency,
        ROUND(SUM(Revenue)::NUMERIC, 2) AS monetary,
        (DATE '2011-12-09' - MAX(Date_Only::DATE)) AS recency_days    FROM online_retail1
    WHERE CustomerID IS NOT NULL
        AND Revenue > 0
    GROUP BY CustomerID
),
rfm_scores AS (
    SELECT 
        CustomerID,
        recency_days,
        frequency,
        monetary,
        NTILE(5) OVER (ORDER BY recency_days DESC) AS R_score,
        NTILE(5) OVER (ORDER BY frequency ASC) AS F_score,
        NTILE(5) OVER (ORDER BY monetary ASC) AS M_score
    FROM rfm_calc
)
SELECT 
    CustomerID,
    recency_days AS days_since_last_purchase,
    frequency AS total_orders,
    monetary AS lifetime_value
FROM rfm_scores
WHERE R_score <= 2 AND F_score >= 3  -- At Risk definition
ORDER BY monetary DESC
LIMIT 20;