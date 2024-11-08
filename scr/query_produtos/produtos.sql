SELECT product_category_name,
       COUNT(1)

FROM tb_order_items AS t1

LEFT JOIN tb_products AS t2
ON t1.product_id = t2.product_id

GROUP BY product_category_name
ORDER BY COUNT(1) DESC