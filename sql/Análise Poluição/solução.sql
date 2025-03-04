
# 1- Quais poluentes foram considerados na pesquisa?
SELECT DISTINCT(pollutant)
FROM TB_GLOBAL_QUALIDADE_AR;

# 2- Qual foi a média de poluição ao longo do tempo provocada pelo poluente ground-level ozone (o3)?
SELECT country AS pais,
       CAST(timestamp AS DATE) AS data_coleta,
       ROUND(AVG(value) OVER(PARTITION BY country ORDER BY CAST(timestamp AS DATE)), 2) AS media_valor_poluicao
FROM TB_GLOBAL_QUALIDADE_AR
WHERE pollutant = 'o3'
ORDER BY country, data_coleta;

# 3- Qual foi a média de poluição causada pelo poluente ground-level ozone (o3) por país medida em µg/m³ (microgramas por metro cúbico)?
SELECT country AS pais, 
       ROUND(AVG(value),2) AS media_poluicao
FROM TB_GLOBAL_QUALIDADE_AR
WHERE pollutant = 'o3'
AND unit = 'µg/m³'
GROUP BY country
ORDER BY media_poluicao ASC;

# 4- Considerando o resultado anterior, qual país teve maior índice de poluição geral por o3, 
# Itália (IT) ou Espanha (ES)? Por que?
SELECT country AS pais, 
       ROUND(AVG(value),2) AS media_poluicao, 
       STDDEV(value) AS desvio_padrao, 
       MAX(value) AS valor_maximo, 
       MIN(value) AS valor_minimo
FROM TB_GLOBAL_QUALIDADE_AR
WHERE pollutant = 'o3'
AND unit = 'µg/m³'
AND country IN ('IT', 'ES') 
GROUP BY country
ORDER BY media_poluicao ASC;

# O Coeficiente de Variação (CV) é uma medida estatística da dispersão dos dados em uma série de dados em torno da média. 
# O Coeficiente de Variação representa a razão entre o desvio padrão e a média e é uma estatística útil para comparar o grau 
# de variação de uma série de dados para outra, mesmo que as médias sejam drasticamente diferentes umas das outras.

# Quanto maior o Coeficiente de Variação , maior o nível de dispersão em torno da média, logo, maior variabilidade.

# O Coeficiente de Variação é calculado da seguinte forma: CV = (Desvio Padrão / Média) * 100

SELECT country AS pais, 
       ROUND(AVG(value),2) AS media_poluicao, 
       STDDEV(value) AS desvio_padrao, 
       MAX(value) AS valor_maximo, 
       MIN(value) AS valor_minimo,
       (STDDEV(value) / ROUND(AVG(value),2)) * 100 AS cv
FROM TB_GLOBAL_QUALIDADE_AR
WHERE pollutant = 'o3'
AND unit = 'µg/m³'
AND country IN ('IT', 'ES') 
GROUP BY country
ORDER BY media_poluicao ASC;

# Conclusão: Embora o CV da Espanha seja muito maior, a média da Itália é muito alta, com os pontos de dados mais próximos da média.
# Os 2 países tem um alto índice de poluição geral por o3
# A Itália apresenta maior índice de poluição geral, pois a média é alta e os pontos de dados estão mais próximos da média.

# 5- Quais localidades e países tiveram média de poluição em 2020 superior a 100 µg/m³ para o poluente fine particulate matter (pm25)?
SELECT COALESCE(location, "Total") AS localidade,
	COALESCE(country, "Total") AS pais, 
       ROUND(AVG(value), 2) AS media_poluicao
FROM cap09.TB_GLOBAL_QUALIDADE_AR
WHERE pollutant = 'pm25'
AND YEAR(timestamp) = 2020
GROUP BY location, country WITH ROLLUP
HAVING media_poluicao > 100
ORDER BY location, country;


# 6- Qual foi o país com o maior nível de poluição média no último ano disponível na base?
SELECT country AS pais, 
       ROUND(AVG(value),2) AS media_poluicao
FROM TB_GLOBAL_QUALIDADE_AR
WHERE YEAR(timestamp) = (SELECT MAX(YEAR(timestamp)) FROM TB_GLOBAL_QUALIDADE_AR)
GROUP BY country
ORDER BY media_poluicao DESC
LIMIT 1;

#  A india foi o país com maior média de poluição no último ano registrado na base.


# 7- Qual o nível máximo de poluição registrado por poluente em cada país?
SELECT country AS pais, 
       pollutant AS poluente, 
       MAX(value) AS nivel_maximo_poluicao
FROM TB_GLOBAL_QUALIDADE_AR
GROUP BY country, pollutant
ORDER BY country, nivel_maximo_poluicao DESC;


# 8- Como a poluição variou ao longo dos meses para o poluente dióxido de nitrogênio (no2)?
SELECT DATE_FORMAT(timestamp, '%Y-%m') AS mes, 
       ROUND(AVG(value), 2) AS media_poluicao
FROM TB_GLOBAL_QUALIDADE_AR
WHERE pollutant = 'no2'
GROUP BY mes
ORDER BY mes;

# 9- Quais foram as 3 cidades com maior poluição média em 2020 para o poluente material particulado fino (pm10)?
SELECT city AS cidade, 
       ROUND(AVG(value), 2) AS media_poluicao
FROM TB_GLOBAL_QUALIDADE_AR
WHERE pollutant = 'pm10' AND YEAR(timestamp) = 2020
GROUP BY city
ORDER BY media_poluicao DESC
LIMIT 3;


# 10- Qual foi a variação da poluição média entre 2019 e 2020 para cada poluente?
SELECT pollutant AS poluente, 
       ROUND(AVG(CASE WHEN YEAR(timestamp) = 2019 THEN value END), 2) AS media_2019,
       ROUND(AVG(CASE WHEN YEAR(timestamp) = 2020 THEN value END), 2) AS media_2020,
       ROUND( (AVG(CASE WHEN YEAR(timestamp) = 2020 THEN value END) - 
               AVG(CASE WHEN YEAR(timestamp) = 2019 THEN value END)) 
               / AVG(CASE WHEN YEAR(timestamp) = 2019 THEN value END) * 100, 2) AS variacao_percentual
FROM TB_GLOBAL_QUALIDADE_AR
WHERE YEAR(timestamp) IN (2019, 2020)
GROUP BY pollutant
ORDER BY variacao_percentual DESC;
