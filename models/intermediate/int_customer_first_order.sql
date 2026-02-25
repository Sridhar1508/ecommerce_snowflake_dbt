/*USE CASE 4: First Order per Customer

Business Scenario
Business wants to identify:
    New customers
    First purchase date
    Customer acquisition metrics

Business Need:
Find the first order placed by each customer.*/

{{ config(materialized='table', schema='intermediate') }}

SELECT DISTINCT c.customer_unique_id,o.order_id,o.order_purchase_date
FROM {{ ref('stg_order') }} o
JOIN {{ ref('stg_customer') }} c
ON o.customer_id = c.customer_id ORDER BY c.customer_unique_id,o.order_purchase_date