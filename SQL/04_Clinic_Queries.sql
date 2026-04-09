-- Q1: Revenue by channel

SELECT sales_channel, SUM(amount)
FROM clinic_sales
WHERE YEAR(datetime)=2021
GROUP BY sales_channel;

-- Q2: Top 10 customers

SELECT uid, SUM(amount) AS total
FROM clinic_sales
GROUP BY uid
ORDER BY total DESC
LIMIT 10;

-- Q3: Profit/Loss

SELECT 
    MONTH(cs.datetime) AS month,
    SUM(cs.amount) AS revenue,
    SUM(e.amount) AS expense,
    SUM(cs.amount) - SUM(e.amount) AS profit,
    CASE 
        WHEN SUM(cs.amount) - SUM(e.amount) > 0 THEN 'Profit'
        ELSE 'Loss'
    END AS status
FROM clinic_sales cs
JOIN expenses e ON cs.cid = e.cid
GROUP BY MONTH(cs.datetime);

