/*USE CASE 5: Customer Lifetime Value

Business Scenario
Business wants to know:
    Who are high value customers
    Total revenue generated per customer

Business Need
Calculate total spending and number of orders per customer.*/

{{ config(materialized='table', schema='intermediate') }}

SELECT c.customer_unique_id,count(o.order_id) AS total_orders,sum(oi.price) AS lifetime_value,round(sum(oi.price)/count(o.order_id),0) as avg_order_value
    FROM {{ ref('stg_order') }} o
    JOIN {{ ref('stg_customer') }} c ON o.customer_id = c.customer_id
    LEFT JOIN {{ ref('stg_order_items') }} oi
    ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
    ORDER BY c.customer_unique_id