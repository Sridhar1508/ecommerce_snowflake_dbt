/*USE CASE 3: Order Metrics Calculation

Business Scenario
Business wants to know:
    Total order value
    Number of items in each order

Business Need:
Create calculated metrics per order using order items table.*/

{{ config(materialized='table', schema='intermediate') }}

SELECT DISTINCT order_id,product_id,price,
    sum(price) OVER(PARTITION BY order_id) AS order_total,
    count(product_id) OVER(PARTITION BY order_id) AS total_items 
FROM {{ ref('stg_order_items') }}