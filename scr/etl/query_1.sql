SELECT t2.seller_id,
    SUM ( t2.price ) AS receita_total,
    COUNT ( DISTINCT t2.order_id ) AS qntd_vendas,
    SUM ( t2.price ) / COUNT ( DISTINCT t2.order_id ) AS avg_val_vendas,

    COUNT ( t2.product_id ) as qntd_produto,
    COUNT ( DISTINCT t2.product_id ) as qntd_produto_dist

FROM tb_orders AS t1

LEFT JOIN tb_order_items AS t2
ON t1.order_id = t2.order_id


WHERE t1.order_approved_at BETWEEN '2016-10-01' 
AND '2017-04-01'
AND t1.order_status = 'delivered'

GROUP BY t2.seller_id

SELECT * FROM tb_order_items limit 10

