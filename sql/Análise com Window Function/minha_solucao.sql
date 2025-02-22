# 1- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro?
SELECT AVG(duracao_segundos) AS MEDIA_TEMPO,
	   tipo_membro
FROM tb_bikes
GROUP BY tipo_membro;

# 2- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e 
# por estação fim (onde as bikes são entregues após o aluguel)?
SELECT AVG(duracao_segundos) AS MEDIA_TEMPO,
	   tipo_membro,
       estacao_fim
FROM tb_bikes
GROUP BY tipo_membro, estacao_fim;



# 3- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro por estação fim 
# (onde as bikes são entregues após o aluguel) ao longo do tempo?
 
 SELECT tipo_membro,
       estacao_fim,
       AVG(duracao_segundos) OVER (PARTITION BY tipo_membro ORDER BY data_inicio) AS media_longo_tempo
FROM tb_bikes;

# 4- Qual hora do dia (independente do mês) a bike de número W01182 teve o maior número de aluguéis considerando a data de início?
SELECT COUNT(duracao_segundos) AS NUM_ALUGUEIS,
	   HOUR(data_inicio) AS HORA_DIA
FROM tb_bikes
WHERE numero_bike = 'W01182'
GROUP BY HORA_DIA
ORDER BY NUM_ALUGUEIS DESC;


# 5- Qual o número de aluguéis da bike de número W01182 ao longo do tempo considerando a data de início?
SELECT CAST(data_inicio AS DATE) AS data_inicio,
       tipo_membro,
       estacao_fim,
       COUNT(duracao_segundos) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS DATE)) AS media_longo_tempo
FROM tb_bikes
WHERE numero_bike = 'W01182';

# 6- Retornar:
# Estação fim, data fim de cada aluguel de bike e duração de cada aluguel em segundos
# Número de aluguéis de bikes (independente da estação) ao longo do tempo
# Somente os registros quando a data fim foi no mês de Abril
SELECT estacao_fim,
	   data_fim,
       duracao_segundos,
       COUNT(duracao_segundos) OVER (ORDER BY data_fim) AS num_alugueis
FROM tb_bikes
WHERE MONTH(data_fim) = 04;


# 7- Retornar:
# Estação fim, data fim e duração em segundos do aluguel
# A data fim deve ser retornada no formato: 01/January/2012 00:00:00
# Queremos a ordem (classificação ou ranking) dos dias de aluguel ao longo do tempo
# Retornar os dados para os aluguéis entre 7 e 11 da manhã
SELECT estacao_fim,
	   date_format(data_fim, '%d/%M/%Y %H:%i:%s') AS data_fim,
       duracao_segundos,
       ROW_NUMBER() OVER (PARTITION BY estacao_fim ORDER BY date_format(data_fim, '%d/%M/%Y %H:%i:%s')) AS num_alugueis
FROM tb_bikes
WHERE HOUR(data_inicio) BETWEEN 7 AND 11;


# 8- Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para outro, considerando data de início do aluguel e estação de início?
# A data de início deve ser retornada no formato: Sat/Jan/12 00:00:00 (Sat = Dia da semana abreviado e Jan igual mês abreviado). Retornar os dados para os aluguéis entre 01 e 03 da manhã
SELECT estacao_inicio,
       DATE_FORMAT(data_inicio, "%a/%b/%y %H:%i:%S") AS data_inicio,
       duracao_segundos,
       duracao_segundos - LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS diferenca
FROM exec5.TB_BIKES
WHERE EXTRACT(HOUR FROM data_fim) BETWEEN 01 AND 03;


# 9- Retornar:
# Estação fim, data fim e duração em segundos do aluguel
# A data fim deve ser retornada no formato: 01/January/2012 00:00:00
# Queremos os registros divididos em 4 grupos ao longo do tempo por partição
# Retornar os dados para os aluguéis entre 8 e 10 da manhã
# Qual critério usado pela função NTILE para dividir os grupos?
SELECT estacao_fim,
       DATE_FORMAT(data_fim, "%d/%M/%Y %H:%i:%S") AS data_fim,
       duracao_segundos,
       NTILE(4) OVER (PARTITION BY estacao_fim ORDER BY CAST(data_fim as date)) AS ranking_aluguel
FROM exec5.TB_BIKES
WHERE EXTRACT(HOUR FROM data_fim) BETWEEN 08 AND 11;


# 10- Quais estações tiveram mais de 35 horas de duração total do aluguel de bike ao longo do tempo considerando a data fim e estação fim?
# Retorne os dados entre os dias '2012-04-01' e '2012-04-02'
# Dica: Use função window e subquery
SELECT *
FROM
 (SELECT estacao_fim,
          CAST(data_fim as date) AS data_fim,
          SUM(duracao_segundos/60/60) OVER (PARTITION BY estacao_fim ORDER BY CAST(data_fim as date)) AS tempo_total_horas
  FROM exec5.TB_BIKES
  WHERE data_fim BETWEEN '2012-04-01' AND '2012-04-02') resultado
WHERE resultado.tempo_total_horas > 35
ORDER BY resultado.estacao_fim;
