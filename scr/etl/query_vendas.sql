SELECT t2.seller_id,
    SUM ( t2.price ) AS receita_total,
    SUM ( t2.price ) / COUNT ( DISTINCT t2.order_id ) AS avg_val_vendas,
    SUM ( t2.price ) / 6 AS avg_val_vendas_mes,
    COUNT ( DISTINCT t2.order_id ) AS qntd_vendas,

    COUNT ( t2.product_id ) AS qntd_produto,
    COUNT ( DISTINCT t2.product_id ) AS qntd_produto_dist,
    SUM ( t2.price ) / COUNT ( t2.product_id ) AS avg_val_produto,
    COUNT ( t2.product_id ) / COUNT ( DISTINCT t2.order_id ) AS avg_qntd_produto_venda


FROM tb_orders AS t1

LEFT JOIN tb_order_items AS t2
ON t1.order_id = t2.order_id

WHERE t1.order_approved_at BETWEEN '2016-10-01' 
AND '2017-04-01'
AND t1.order_status = 'delivered'

GROUP BY t2.seller_id

SELECT * FROM tb_order_items limit 10

