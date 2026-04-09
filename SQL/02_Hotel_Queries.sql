-- Q1 - Last booked room

SELECT user_id, room_no
FROM bookings b
WHERE booking_date = (
    SELECT MAX(booking_date)
    FROM bookings
    WHERE user_id = b.user_id
);

-- Q2 - Total billing in Nov 2021

SELECT bc.booking_id,
SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 11 AND YEAR(bc.bill_date) = 2021
GROUP BY bc.booking_id;

-- Q3: Bills > 1000

SELECT bill_id,
SUM(item_quantity * i.item_rate) AS total
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bill_date)=10 AND YEAR(bill_date)=2021
GROUP BY bill_id
HAVING total > 1000;

-- Q4: Most & least ordered item per month

WITH item_orders AS (
    SELECT 
        MONTH(bill_date) AS month,
        item_id,
        SUM(item_quantity) AS total_qty,
        RANK() OVER (PARTITION BY MONTH(bill_date) ORDER BY SUM(item_quantity) DESC) AS rnk_desc,
        RANK() OVER (PARTITION BY MONTH(bill_date) ORDER BY SUM(item_quantity) ASC) AS rnk_asc
    FROM booking_commercials
    GROUP BY MONTH(bill_date), item_id
)
SELECT * FROM item_orders WHERE rnk_desc=1 OR rnk_asc=1;

-- Q5: Second highest bill

WITH bill_rank AS (
    SELECT 
        bill_id,
        MONTH(bill_date) AS month,
        SUM(item_quantity * i.item_rate) AS total,
        RANK() OVER (PARTITION BY MONTH(bill_date) ORDER BY SUM(item_quantity * i.item_rate) DESC) AS rnk
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    GROUP BY bill_id, MONTH(bill_date)
)
SELECT * FROM bill_rank WHERE rnk = 2;