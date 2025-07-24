# Projeto de Engenharia de Dados sobre Terremotos com Microsoft Fabric

### Visão Geral do Projeto
Este projeto demonstra a construção de uma solução completa de engenharia de dados, desde a ingestão até a análise, utilizando o ecossistema do Microsoft Fabric. O fluxo de trabalho abrange as seguintes etapas:

- Configuração do Ambiente no Fabric:

- Criação de um Workspace dedicado para centralizar todos os artefatos do projeto.

- Criação de um Lakehouse para servir como a base de armazenamento dos dados, seguindo a arquitetura Medalhão.

Processamento de Dados (ETL):

- Ingestão de dados de eventos sísmicos a partir da API pública do USGS.

- Implementação da arquitetura Bronze, Silver e Gold através de notebooks PySpark para limpar, transformar e enriquecer os dados.

Orquestração do Pipeline:

- Desenvolvimento de um Data Pipeline no Data Factory para automatizar e orquestrar a execução sequencial dos notebooks (Bronze → Silver → Gold), garantindo a atualização contínua dos dados.

- (Observação: A definição do pipeline será adicionada a este repositório em breve.)

Análise e Visualização:

- Utilização da camada Gold, já otimizada, como fonte de dados para um relatório no Power BI.

- O painel do Power BI está em desenvolvimento para permitir a análise interativa e a exploração visual dos padrões de terremotos em todo o mundo.

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






