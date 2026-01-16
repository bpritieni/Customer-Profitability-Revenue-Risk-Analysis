SELECT
    Contract,
    InternetService,
    CASE
        WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
        WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
        ELSE '25+ months'
    END AS tenure_band,
    COUNT(customerID) AS customer_count,
    ROUND(AVG(net_ltv), 2) AS avg_net_ltv,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN net_ltv ELSE 0 END), 2) AS revenue_at_risk
FROM customermetrics
GROUP BY
    Contract,
    InternetService,
    tenure_band
ORDER BY
    avg_net_ltv DESC,
    customer_count DESC;
