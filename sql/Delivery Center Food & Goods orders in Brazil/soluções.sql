# Exercicios

# 1- Qual o número de hubs (centros de distribuição) por cidade?
SELECT COUNT(hub_id) AS hubs,
       hub_city
FROM hubs
GROUP BY hub_city
ORDER BY hubs;


# 2- Qual o número de pedidos (orders) por status?
SELECT COUNT(order_id) AS orders,
       order_status
FROM orders
GROUP BY order_status
ORDER BY orders;


# 3- Qual o número de lojas (stores) por cidade dos hubs?
SELECT COUNT(S.store_id) AS total_lojas,
	   H.hub_city AS cidade
FROM stores S
INNER JOIN hubs H
ON S.hub_id = H.hub_id
GROUP BY cidade;


# 4- Qual o maior e o menor valor de pagamento (payment_amount) registrado?
SELECT MIN(payment_amount) AS menor_valor,
	   MAX(payment_amount) AS maior_valor
FROM payments;


# 5- Qual tipo de driver (driver_type) fez o maior número de entregas?
SELECT COUNT(DE.delivery_id) AS total_entregas,
	CASE
	   WHEN D.driver_type IS NULL THEN "SEM TIPO"
       ELSE D.driver_type
       END AS tipo_entrega
FROM deliveries DE
LEFT JOIN drivers D ON D.driver_id = DE.driver_id
GROUP BY D.driver_type;

SELECT *
FROM deliveries;


# 6- Qual a distância média das entregas por tipo de driver (driver_modal)?
SELECT *
FROM drivers;

SELECT *
FROM deliveries;

SELECT ROUND(AVG(DE.delivery_distance_meters), 2) AS MEDIA_ENTREGA,
	   D.driver_modal AS TIPO_ENTREGA	
FROM deliveries DE
INNER JOIN drivers D ON DE.driver_id = D.driver_id
GROUP BY TIPO_ENTREGA;

# 7- Qual a média de valor de pedido (order_amount) por loja, em ordem decrescente?
SELECT ROUND(AVG(O.order_amount), 2) AS media_vlr_pedido,
	   S.store_name
FROM orders O
INNER JOIN stores S ON O.store_id = S.store_id
GROUP BY S.store_name
ORDER BY ROUND(AVG(O.order_amount), 2) DESC; 

# 8- Existem pedidos que não estão associados a lojas? Se caso positivo, quantos?
SELECT COUNT(O.order_id) AS total_pedidos,
	   S.store_name
FROM stores S 
LEFT JOIN orders O ON O.store_id = S.store_id
WHERE S.store_name IS NULL
GROUP BY S.store_name;

# 9- Qual o valor total de pedido (order_amount) no channel 'FOOD PLACE'?
SELECT ROUND(SUM(order_amount), 2) AS total_pedido,
	   C.channel_name
FROM orders O
INNER JOIN channels C ON O.channel_id = C.channel_id
WHERE C.channel_name = 'FOOD PLACE'
GROUP BY C.channel_name;

# 10- Quantos pagamentos foram cancelados (chargeback)?
SELECT COUNT(payment_status) AS STATUS,
	   payment_status
FROM PAYMENTS
WHERE payment_status = 'chargeback'
GROUP BY payment_status;

# 11- Qual foi o valor médio dos pagamentos cancelados (chargeback)?
SELECT ROUND(AVG(payment_amount), 2) AS vlr_medio,
	   payment_status
FROM PAYMENTS
WHERE payment_status = 'chargeback'
GROUP BY payment_status;


# 12- Qual a média do valor de pagamento por método de pagamento (payment_method) em ordem decrescente?
SELECT ROUND(AVG(payment_amount), 2) AS vlr_medio,
	   payment_method
FROM PAYMENTS
GROUP BY payment_method
ORDER BY vlr_medio DESC;


# 13- Quais métodos de pagamento tiveram valor médio superior a 100?
SELECT ROUND(AVG(payment_amount), 2) AS vlr_medio,
	   payment_method
FROM PAYMENTS
GROUP BY payment_method
HAVING vlr_medio > 100
ORDER BY vlr_medio DESC;


# 14- Qual a média de valor de pedido (order_amount) por estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type)?
SELECT ROUND(AVG(O.order_amount), 2) as media_vlr_pedido,
	   REPLACE((S.store_segment), 'G', 'F') AS store_segment,
       H.hub_state,
       C.channel_type
FROM orders O
INNER JOIN stores S ON O.store_id = S.store_id
INNER JOIN hubs H ON S.hub_id = H.hub_id
INNER JOIN channels C ON O.channel_id = C.channel_id 
GROUP BY H.hub_state, REPLACE((S.store_segment), 'G', 'F'), C.channel_type
ORDER BY H.hub_state;


SELECT * 
FROM orders;

# 15- Qual estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type) teve média de valor de pedido (order_amount) maior que 450?
SELECT ROUND(AVG(O.order_amount), 2) as media_vlr_pedido,
	   REPLACE((S.store_segment), 'G', 'F') AS store_segment,
       H.hub_state,
       C.channel_type
FROM orders O
INNER JOIN stores S ON O.store_id = S.store_id
INNER JOIN hubs H ON S.hub_id = H.hub_id
INNER JOIN channels C ON O.channel_id = C.channel_id 
GROUP BY H.hub_state, REPLACE((S.store_segment), 'G', 'F'), C.channel_type
HAVING media_vlr_pedido > 450;

# 16- Qual o valor total de pedido (order_amount) por estado do hub (hub_state), segmento da loja (store_segment) e tipo de canal (channel_type)? Demonstre os totais intermediários e formate o resultado.
SELECT ROUND(SUM(O.order_amount), 2) as total_vlr_pedido,
	   S.store_segment AS store_segment,
       H.hub_state,
       C.channel_type
FROM orders O
INNER JOIN stores S ON O.store_id = S.store_id
INNER JOIN hubs H ON S.hub_id = H.hub_id
INNER JOIN channels C ON O.channel_id = C.channel_id 
GROUP BY H.hub_state, S.store_segment, C.channel_type
ORDER BY H.hub_state;


# 17- Quando o pedido era do Hub do Rio de Janeiro (hub_state), segmento de loja 'FOOD', tipo de canal Marketplace e foi cancelado, qual foi a média de valor do pedido (order_amount)?
SELECT ROUND(AVG(O.order_amount), 2) as media_vlr_pedido,
	   H.hub_state,
	   S.store_segment,
       C.channel_type,
       O.order_status
FROM orders O
INNER JOIN stores S ON O.store_id = S.store_id
INNER JOIN hubs H ON S.hub_id = H.hub_id
INNER JOIN channels C ON O.channel_id = C.channel_id 
WHERE H.hub_state = 'RJ' AND S.store_segment = 'FOOD' AND C.channel_type = 'Marketplace' AND O.order_status = 'CANCELED'
GROUP BY H.hub_state, S.store_segment, C.channel_type, O.order_status;

# 18- Quando o pedido era do segmento de loja 'GOOD', tipo de canal Marketplace e foi cancelado, algum hub_state teve total de valor do pedido superior a 100.000?
SELECT ROUND(SUM(O.order_amount), 2) as total_vlr_pedido,
	   H.hub_state,
	   S.store_segment,
       C.channel_type,
       O.order_status
FROM orders O
INNER JOIN stores S ON O.store_id = S.store_id
INNER JOIN hubs H ON S.hub_id = H.hub_id
INNER JOIN channels C ON O.channel_id = C.channel_id 
WHERE H.hub_state = 'RJ' AND S.store_segment = 'GOOD' AND C.channel_type = 'Marketplace' AND O.order_status = 'CANCELED'
GROUP BY H.hub_state, S.store_segment, C.channel_type, O.order_status
HAVING media_vlr_pedido > 100.000; 


# 19- Em que data houve a maior média de valor do pedido (order_amount)? Dica: Pesquise e use a função SUBSTRING().
SELECT SUBSTRING(order_moment_created, 1, 9) AS DATA,
	   ROUND(AVG(order_amount), 2 ) AS maior_media_vlr_pedido
FROM orders
GROUP BY DATA
ORDER BY maior_media_vlr_pedido DESC;


# 20- Em quais datas o valor do pedido foi igual a zero (ou seja, não houve venda)? Dica: Use a função SUBSTRING().
SELECT SUBSTRING(order_moment_created, 1, 9) AS DATA,
	   MIN(order_amount) AS min_valor	
FROM orders
GROUP BY DATA
HAVING min_valor = 0
ORDER BY DATA



