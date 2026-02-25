/*USE CASE 1: Order 360 View
Business Scenario:
The business wants a complete view of each order to analyze:
    Customer location
    Order value
    Payment amount
    Review score
    Order status

This helps business answer:
    Which states generate most revenue?
    Which orders have low review scores?
    Which customers are high value?

Business Need:
Create a dataset where each row represents one order with all important details combined.*/


{{ config(materialized='table', schema='intermediate') }}

SELECT o.order_id,o.customer_id,c.city,c.state,o.order_status,p.payment_value as total_payment,r.review_score 
    FROM stg_order o 
    LEFT JOIN {{ ref('stg_customer') }} c on o.customer_id = c.customer_id 
    LEFT JOIN {{ ref('stg_payments') }} p on o.order_id = p.order_id
    LEFT JOIN {{ ref('stg_reviews') }} r on o.order_id = r.order_id;