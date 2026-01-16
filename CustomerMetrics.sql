
   SELECT
        customerID,
        Contract,
        InternetService,
        tenure,
        MonthlyCharges,
        MonthlyCharges * tenure AS gross_ltv,
        CASE
            WHEN InternetService = 'Fiber optic' THEN 45 * tenure
            WHEN InternetService = 'DSL' THEN 30 * tenure
            ELSE 15 * tenure
        END AS estimated_service_cost,
        (MonthlyCharges * tenure) -
        CASE
            WHEN InternetService = 'Fiber optic' THEN 45 * tenure
            WHEN InternetService = 'DSL' THEN 30 * tenure
            ELSE 15 * tenure
        END AS net_ltv,
        Churn
    FROM customerchurn