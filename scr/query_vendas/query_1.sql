SELECT t2.seller_id,
    t3.idade_base AS idade_base_dias,
    1 + CAST(t3.idade_base / 30 AS integer) AS idade_base_mes,

    COUNT( DISTINCT STRFTIME('%m', t1.order_approved_at) ) AS qtd_mes_ativacao,
    CAST( COUNT( DISTINCT STRFTIME('%m', t1.order_approved_at) ) AS float) / MIN( 1 + CAST( t3.idade_base / 30 AS integer), 6 ) AS prop_ativacao,
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

LEFT JOIN(
   SELECT 
        t2.seller_id,
        max(julianday('2017-04-01') - julianday(t1.order_approved_at)) as idade_base

    FROM tb_orders AS t1

    LEFT JOIN tb_order_items AS t2
    ON t1.order_id = t2.order_id

    WHERE t1.order_approved_at < '2017-04-01'
    AND t1.order_status = 'delivered'

    GROUP BY t2.seller_id
) AS t3
ON t2.seller_id = t3.seller_id

WHERE t1.order_approved_at BETWEEN '2016-10-01' 
AND '2017-04-01'
AND t1.order_status = 'delivered'

GROUP BY t2.seller_id