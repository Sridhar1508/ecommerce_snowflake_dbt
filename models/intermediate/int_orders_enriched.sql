{{ config(materialized='table') }}

SELECT
    o.ORDER_ID,
    o.CUSTOMER_ID,
    c.CUSTOMER_CITY,
    c.CUSTOMER_STATE,
    o.ORDER_PURCHASE_DATE
FROM staging.stg_order o
JOIN staging.stg_customer c
ON o.CUSTOMER_ID = c.CUSTOMER_ID