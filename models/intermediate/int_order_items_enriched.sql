/*USE CASE 2: Order Item Detailed View

Business Scenario:
Business wants to analyze:
    Which products sell most
    Which sellers generate more revenue
    Which product category performs best

Business Need:
Create dataset where each row = one order item with product and seller details.*/

{{ config(materialized='table', schema='intermediate') }}

SELECT o.order_id,o.product_id,o.seller_id,o.price,o.freight_value,p.product_category_name,s.seller_city,s.seller_state
    FROM {{ ref('stg_order_items') }} o
    LEFT JOIN {{ ref('stg_products') }} p ON o.product_id = p.product_id
    LEFT JOIN {{ ref('stg_sellers') }} s ON o.seller_id = s.seller_id
