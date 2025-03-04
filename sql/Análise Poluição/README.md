# Análise de dados sobre poluição do ar

## Etapa 1 - Definição do Objetivo

O objetivo deste trabalho é extrair informações sobre os índices de poluição do ar em localidades ao redor do mundo. As 10 perguntas abaixo foram respondidas utilizando a linguagem SQL em um banco de dados MySQL:

### 1- Quais poluentes foram considerados na pesquisa?

### 2- Qual foi a média de poluição ao longo do tempo provocada pelo poluente ground-level ozone (o3)?

### 3- Qual foi a média de poluição causada pelo poluente ground-level ozone (o3) por país medida em µg/m³ (microgramas por metro cúbico)?

### 4- Considerando o resultado anterior, qual país teve maior índice de poluição geral por o3, Itália (IT) ou Espanha (ES)? Por quê?

### 5- Quais localidades e países tiveram média de poluição em 2020 superior a 100 µg/m³ para o poluente fine particulate matter (pm25)?

### 6- Qual foi o país com o maior nível de poluição média no último ano disponível na base?

### 7- Qual o nível máximo de poluição registrado por poluente em cada país?

### 8- Como a poluição variou ao longo dos meses para o poluente dióxido de nitrogênio (no2)?

### 9- Quais foram as 3 cidades com maior poluição média em 2023 para o poluente material particulado fino (pm10)?

### 10- Qual foi a variação da poluição média entre 2022 e 2023 para cada poluente?


## Etapa 2 - Coleta e Extração de Dados

Os dados estão disponíveis em formato CSV e foram extraídos do kaggle neste [LINK](https://www.kaggle.com/open-aq/openaq?select=global_air_quality). Os dados foram carregados via linha de comando no MySQL.


## Etapa 3 - Entrega dos Resultados

**Acesse a solução em SQL [AQUI](/sql/Análise%20Poluição/solução.sql)**

**Conclusão:**

A Itália foi o país que apresentou o maior índice geral de poluição pelo poluente o3. Embora a Espanha tenha maior dispersão dos dados, a Itália tem uma média mais alta e a maioria dos pontos de dados em torno da média.

Entre as localidades com maior média de poluição pelo poluente pm25, duas ficam na Índia.


