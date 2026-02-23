{{ config(materialized='table') }}

SELECT
    o.order_id,
    o.customer_id,
    c.city,
    c.state,
    o.order_purchase_timestamp
FROM RETAIL_DWH.RAW.ORDERS o
JOIN RETAIL_DWH.RAW.CUSTOMERS c
ON o.customer_id = c.customer_id