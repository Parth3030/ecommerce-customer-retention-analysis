WITH rfm_calc AS (
    SELECT 
        CustomerID,
        MAX(Date_Only) AS last_purchase_date,
        COUNT(DISTINCT InvoiceNo) AS frequency,
        ROUND(SUM(Revenue)::NUMERIC, 2) AS monetary,
        (DATE '2011-12-09' - MAX(Date_Only::DATE)) AS recency_days
    FROM online_retail1
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
    recency_days,
    frequency,
    monetary,
    R_score,
    F_score,
    M_score,
    CASE 
        WHEN R_score >= 4 AND F_score >= 4 AND M_score >= 4 THEN 'Champions'
        WHEN R_score >= 3 AND F_score >= 3 THEN 'Loyal Customers'
        WHEN R_score >= 4 AND F_score <= 2 THEN 'New Customers'
        WHEN R_score <= 2 AND F_score >= 3 THEN 'At Risk'
        WHEN R_score <= 2 AND F_score <= 2 THEN 'Lost Customers'
        WHEN R_score = 3 AND F_score <= 2 THEN 'Promising'
        ELSE 'Needs Attention'
    END AS customer_segment
FROM rfm_scores
ORDER BY monetary DESC;