# Projeto de Engenharia de Dados sobre Terremotos com Microsoft Fabric

### Visão Geral do Projeto
Construir um pipeline completo de engenharia e análise de dados utilizando os recursos do Microsoft Fabric: Data Factory, Data Engineering e Power BI.

Ingestão de dados de eventos sísmicos da USGS.

**Tecnologias Utilizadas:** Python, PySpark, Fabric (Data Engineering, Data Factory, Power BI)


### Conteúdo do Repositório

**Processamento da Camada Bronze – API de Eventos Sísmicos Globais:**
Este notebook foca na ingestão de dados brutos sobre terremotos a partir da API da USGS. Ele realiza um processamento mínimo para armazenar os dados em seu formato original, servindo como a camada base para refinamentos posteriores.

**Processamento da Camada Silver – API de Eventos Sísmicos Globais:**
Este notebook aprimora os dados da camada Bronze por meio de limpeza, transformação e consolidação dos dados de terremotos. Ele prepara os dados para análises mais avançadas.

**Processamento da Camada Gold – API de Eventos Sísmicos Globais:**
Nesta etapa final de processamento, o notebook refina os dados para criar conjuntos de dados prontos para uso em negócios. Esses dados são otimizados para obter insights valiosos e adaptados para fins analíticos específicos, como relatórios e visualizações em ferramentas como o Power BI.

### Definições dos Atributos dos Dados

* id: Identificador em formato string para cada registro de dados.
* latitude: Latitude do evento, armazenada como número decimal (double).
* longitude: Longitude do evento, também armazenada como número decimal (double).
* elevation: Elevação onde o evento ocorreu, expressa em metros (double).
* title: String representando o título ou nome do evento.
* place_description: String descrevendo a localização do evento.
* sig: (bigint) representando a pontuação de significância do evento.
* mag: Valor decimal indicando a magnitude do terremoto.
* magType: String descrevendo o tipo de escala de magnitude utilizada.
* time: Timestamp marcando o horário exato do evento.
* updated: Timestamp indicando a última atualização dos dados do evento.






