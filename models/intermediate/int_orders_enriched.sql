{{ config(materialized='table') }}

SELECT
    o.ORDER_ID,
    o.CUSTOMER_ID,
    c.CITY,
    c.STATE,
    o.ORDER_PURCHASE_DATE
FROM {{ ref('stg_order') }} o
JOIN {{ ref('stg_customer') }} c
ON o.CUSTOMER_ID = c.CUSTOMER_ID