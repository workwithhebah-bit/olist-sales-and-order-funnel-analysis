-- ============================
-- DATA EXPLORATION
-- ============================

SELECT * FROM orders LIMIT 10;

SELECT COUNT(*) as total_orders FROM orders;

-- ============================
-- MASTER JOIN QUERY
-- ============================

SELECT
  o.order_id,
  o.customer_id,
  o.order_status,
  o.order_purchase_timestamp,
  o.order_approved_at,
  o.order_delivered_customer_date,
  o.order_estimated_delivery_date,
  c.customer_city,
  c.customer_state,
  pay.payment_type,
  pay.payment_value,
  r.review_score,
  i.price,
  i.freight_value,
  t.product_category_name_english

FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN payments pay ON o.order_id = pay.order_id
LEFT JOIN reviews r ON o.order_id = r.order_id
LEFT JOIN items i ON o.order_id = i.order_id
LEFT JOIN products p ON i.product_id = p.product_id
LEFT JOIN translation t ON p.product_category_name = t.product_category_name

WHERE o.order_status != 'canceled'
AND pay.payment_value IS NOT NULL;

-- ============================
-- FUNNEL STAGES QUERY
-- ============================

SELECT
  COUNT(DISTINCT o.order_id) AS stage_1_total_orders,
  COUNT(DISTINCT CASE WHEN o.order_status IN 
       ('approved','processing','shipped','delivered','invoiced')
       THEN o.order_id END) AS stage_2_approved,
  COUNT(DISTINCT CASE WHEN o.order_status IN ('shipped','delivered')
       THEN o.order_id END) AS stage_3_shipped,
  COUNT(DISTINCT CASE WHEN o.order_status = 'delivered'
       THEN o.order_id END) AS stage_4_delivered,
  COUNT(DISTINCT CASE WHEN o.order_status = 'delivered'
       AND r.review_score IS NOT NULL
       THEN o.order_id END) AS stage_5_reviewed

FROM orders o
LEFT JOIN reviews r ON o.order_id = r.order_id;
