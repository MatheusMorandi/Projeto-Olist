SELECT t2.seller_id,
    t3.idade_base AS idade_base_dias,
    1 + CAST(t3.idade_base / 30 AS integer) AS idade_base_mes,
    CAST( julianday('2017-04-01') - julianday( max( t1.order_approved_at ) ) as integer) as qtde_dias_utl_venda,

    COUNT( DISTINCT STRFTIME('%m', t1.order_approved_at) ) AS qtd_mes_ativacao,
    CAST( COUNT( DISTINCT STRFTIME('%m', t1.order_approved_at) ) AS float) / MIN( 1 + CAST( t3.idade_base / 30 AS integer), 6 ) AS prop_ativacao,
    SUM ( t2.price ) AS receita_total,
    SUM ( t2.price ) / COUNT ( DISTINCT t2.order_id ) AS avg_val_vendas,
    SUM ( t2.price ) / 6 AS avg_val_vendas_mes,
    COUNT ( DISTINCT t2.order_id ) AS qntd_vendas,

    COUNT ( t2.product_id ) AS qntd_produto,
    COUNT ( DISTINCT t2.product_id ) AS qntd_produto_dist,
    SUM ( t2.price ) / COUNT ( t2.product_id ) AS avg_val_produto,
    COUNT ( t2.product_id ) / COUNT ( DISTINCT t2.order_id ) AS avg_qntd_produto_venda,
    
    SUM( CASE WHEN product_category_name = 'cama_mesa_banho' THEN 1 ELSE 0 END ) AS qtde_cama_mesa_banho,
    SUM( CASE WHEN product_category_name = 'beleza_saude' THEN 1 ELSE 0 END ) AS qtde_beleza_saude,
    SUM( CASE WHEN product_category_name = 'esporte_lazer' THEN 1 ELSE 0 END ) AS qtde_esporte_lazer,
    SUM( CASE WHEN product_category_name = 'moveis_decoracao' THEN 1 ELSE 0 END ) AS qtde_moveis_decoracao,
    SUM( CASE WHEN product_category_name = 'informatica_acessorios' THEN 1 ELSE 0 END ) AS qtde_informatica_acessorios,
    SUM( CASE WHEN product_category_name = 'utilidades_domesticas' THEN 1 ELSE 0 END ) AS qtde_utilidades_domesticas,
    SUM( CASE WHEN product_category_name = 'relogios_presentes' THEN 1 ELSE 0 END ) AS qtde_relogios_presentes,
    SUM( CASE WHEN product_category_name = 'telefonia' THEN 1 ELSE 0 END ) as qtde_telefonia,
    SUM( CASE WHEN product_category_name = 'ferramentas_jardim' THEN 1 ELSE 0 END ) AS qtde_ferramentas_jardim,
    SUM( CASE WHEN product_category_name = 'automotivo' THEN 1 ELSE 0 END ) AS qtde_automotivo,
    SUM( CASE WHEN product_category_name = 'brinquedos' THEN 1 ELSE 0 END ) AS qtde_brinquedos,
    SUM( CASE WHEN product_category_name = 'cool_stuff' THEN 1 ELSE 0 END ) AS qtde_cool_stuff,
    SUM( CASE WHEN product_category_name = 'perfumaria' THEN 1 ELSE 0 END ) AS qtde_perfumaria,
    SUM( CASE WHEN product_category_name = 'bebes' THEN 1 ELSE 0 END ) AS qtde_bebes,
    SUM( CASE WHEN product_category_name = 'eletronicos' THEN 1 ELSE 0 END ) AS qtde_eletronicos,
    SUM( CASE WHEN product_category_name = 'papelaria' THEN 1 ELSE 0 END ) AS qtde_papelaria,
    SUM( CASE WHEN product_category_name = 'fashion_bolsas_e_acessorios' THEN 1 ELSE 0 END ) AS qtde_fashion_bolsas_e_acessorios,
    SUM( CASE WHEN product_category_name = 'pet_shop' THEN 1 ELSE 0 END ) AS qtde_pet_shop,
    SUM( CASE WHEN product_category_name = 'moveis_escritorio' THEN 1 ELSE 0 END ) AS qtde_moveis_escritorio,
    SUM( CASE WHEN product_category_name = 'consoles_games' THEN 1 ELSE 0 END ) AS qtde_consoles_games,
    SUM( CASE WHEN product_category_name = 'malas_acessorios' THEN 1 ELSE 0 END ) AS qtde_malas_acessorios,
    SUM( CASE WHEN product_category_name = 'construcao_ferramentas_construcao' THEN 1 ELSE 0 END ) AS qtde_construcao_ferramentas_construcao,
    SUM( CASE WHEN product_category_name = 'eletrodomesticos' THEN 1 ELSE 0 END ) AS qtde_eletrodomesticos,
    SUM( CASE WHEN product_category_name = 'instrumentos_musicais' THEN 1 ELSE 0 END ) AS qtde_instrumentos_musicais,
    SUM( CASE WHEN product_category_name = 'eletroportateis' THEN 1 ELSE 0 END ) AS qtde_eletroportateis,
    SUM( CASE WHEN product_category_name = 'casa_construcao' THEN 1 ELSE 0 END ) AS qtde_casa_construcao,
    SUM( CASE WHEN product_category_name = 'livros_interesse_geral' THEN 1 ELSE 0 END ) AS qtde_livros_interesse_geral,
    SUM( CASE WHEN product_category_name = 'alimentos' THEN 1 ELSE 0 END ) AS qtde_alimentos,
    SUM( CASE WHEN product_category_name = 'moveis_sala' THEN 1 ELSE 0 END ) AS qtde_moveis_sala,
    SUM( CASE WHEN product_category_name = 'casa_conforto' THEN 1 ELSE 0 END ) AS qtde_casa_conforto,
    SUM( CASE WHEN product_category_name = 'bebidas' THEN 1 ELSE 0 END ) AS qtde_bebidas,
    SUM( CASE WHEN product_category_name = 'audio' THEN 1 ELSE 0 END ) AS qtde_audio,
    SUM( CASE WHEN product_category_name = 'market_place' THEN 1 ELSE 0 END ) AS qtde_market_place,
    SUM( CASE WHEN product_category_name = 'construcao_ferramentas_iluminacao' THEN 1 ELSE 0 END ) AS qtde_construcao_ferramentas_iluminacao,
    SUM( CASE WHEN product_category_name = 'climatizacao' THEN 1 ELSE 0 END ) AS qtde_climatizacao,
    SUM( CASE WHEN product_category_name = 'moveis_cozinha_area_de_servico_jantar_e_jardim' THEN 1 ELSE 0 END ) AS qtde_moveis_cozinha_area_de_servico_jantar_e_jardim,
    SUM( CASE WHEN product_category_name = 'alimentos_bebidas' THEN 1 ELSE 0 END ) AS qtde_alimentos_bebidas,
    SUM( CASE WHEN product_category_name = 'industria_comercio_e_negocios' THEN 1 ELSE 0 END ) AS qtde_industria_comercio_e_negocios,
    SUM( CASE WHEN product_category_name = 'livros_tecnicos' THEN 1 ELSE 0 END ) AS qtde_livros_tecnicos,
    SUM( CASE WHEN product_category_name = 'telefonia_fixa' THEN 1 ELSE 0 END ) AS qtde_telefonia_fixa,
    SUM( CASE WHEN product_category_name = 'fashion_calcados' THEN 1 ELSE 0 END ) AS qtde_fashion_calcados,
    SUM( CASE WHEN product_category_name = 'eletrodomesticos_2' THEN 1 ELSE 0 END ) AS qtde_eletrodomesticos_2,
    SUM( CASE WHEN product_category_name = 'construcao_ferramentas_jardim' THEN 1 ELSE 0 END ) AS qtde_construcao_ferramentas_jardim,
    SUM( CASE WHEN product_category_name = 'agro_industria_e_comercio' THEN 1 ELSE 0 END ) AS qtde_agro_industria_e_comercio,
    SUM( CASE WHEN product_category_name = 'artes' THEN 1 ELSE 0 END ) AS qtde_artes,
    SUM( CASE WHEN product_category_name = 'pcs' THEN 1 ELSE 0 END ) AS qtde_pcs,
    SUM( CASE WHEN product_category_name = 'sinalizacao_e_seguranca' THEN 1 ELSE 0 END ) AS qtde_sinalizacao_e_seguranca,
    SUM( CASE WHEN product_category_name = 'construcao_ferramentas_seguranca' THEN 1 ELSE 0 END ) AS qtde_construcao_ferramentas_seguranca,
    SUM( CASE WHEN product_category_name = 'artigos_de_natal' THEN 1 ELSE 0 END ) AS qtde_artigos_de_natal

FROM tb_orders AS t1

LEFT JOIN tb_order_items AS t2
ON t1.order_id = t2.order_id

LEFT JOIN(
   SELECT 
        t2.seller_id,
        MAX(julianday('2017-04-01') - julianday(t1.order_approved_at)) AS idade_base

    FROM tb_orders AS t1

    LEFT JOIN tb_order_items AS t2
    ON t1.order_id = t2.order_id

    WHERE t1.order_approved_at < '2017-04-01'
    AND t1.order_status = 'delivered'

    GROUP BY t2.seller_id
) AS t3
ON t2.seller_id = t3.seller_id

LEFT JOIN tb_products AS t4
ON t2.product_id = t4.product_id

WHERE t1.order_approved_at BETWEEN '2016-10-01' 
AND '2017-04-01'
AND t1.order_status = 'delivered'

GROUP BY t2.seller_id