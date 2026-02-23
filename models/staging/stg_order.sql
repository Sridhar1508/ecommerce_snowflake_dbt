select * from raw.orders limit 10;

{{ config(materialized='table') }}

SELECT
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp as order_purchase_date,
    order_approved_at as order_approved_date,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
FROM RETAIL_DWH.RAW.ORDERS