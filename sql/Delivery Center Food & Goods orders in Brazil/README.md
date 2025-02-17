# Projeto - Delivery Center: Food & Goods orders in Brazil

## Sobre o dataset

Food and Goods Deliveries in Brazil

O que é o Delivery Center
Com seus diversos hubs operacionais espalhados pelo Brasil, o Delivery Center é uma plataforma que integra lojistas e marketplaces, criando um ecossistema saudável para vendas de good (produtos) e food (comidas) no varejo brasileiro.

Atualmente temos um cadastro (catálogo + cardápio) com mais de 900 mil itens, milhares de pedidos e entregas são operacionalizados diariamente com uma rede de milhares lojistas e entregadores parceiros espalhados por todas as regiões do país.

Tudo isso gera dados e mais dados a todo momento!

Diante disso, nosso negócio está cada vez data driven, ou seja, utilizando dados para tomar decisões e numa visão de futuro sabemos que utilizar os dados de forma inteligente pode ser o nosso grande diferencial no mercado.

Este é o nosso contexto e com ele lhe propomos um desafio desafio em que você possa aplicar seus conhecimentos técnicos objetivando resolver problemas cotidianos de uma equipe de dados.

### Dados disponíveis

Observe na figura abaixo um modelo de dados no padrão floco de neve (snow flake).

Este modelo representa, de forma fictícia, dados de pedidos e entregas que foram processados pelo Delivery Center entre os meses de janeiro a abril de 2021.

Note que este é um modelo lógico e está fisicamente disponível em datasets no formato csv, ou seja, cada dataset fisicamente disponível representa uma tabela neste esquema abaixo. Aqui estão os datasets.

Os dados não possuem a completude de toda operação do Delivery Center e algumas informações foram anonimizadas devido ao nosso tratamento com a Lei Geral de Proteção de Dados (LGPD).

![logo](/sql/Delivery%20Center%20Food%20&%20Goods%20orders%20in%20Brazil/data_model.png)

### Descrição dos datasets

- **channels:** Este dataset possui informações sobre os canais de venda (marketplaces) onde são vendidos os good e food de nossos lojistas.
- **deliveries:** Este dataset possui informações sobre as entregas realizadas por nossos entregadores parceiros.
- **drivers:** Este dataset possui informações sobre os entregadores parceiros. Eles ficam em nossos hubs e toda vez que um pedido é processado, são eles fazem as entregas na casa dos consumidores.
- **hubs:** Este dataset possui informações sobre os hubs do Delivery Center. Entenda que os Hubs são os centros de distribuição dos pedidos e é dali que saem as entregas.
- **orders:** Este dataset possui informações sobre as vendas processadas através da plataforma do Delivery Center.
payments: Este dataset possui informações sobre os pagamentos realizados ao Delivery Center.
- **stores:** Este dataset possui informações sobre os lojistas. Eles utilizam a Plataforma do Delivery Center para vender seus itens (good e/ou food) nos marketplaces.

### Onde baixar o dataset: https://www.kaggle.com/datasets/nosbielcs/brazilian-delivery-center


# Respondendo Perguntas de Negócio com SQL

# Acesse a solução aqui: [Solução SQL](/sql/Delivery%20Center%20Food%20&%20Goods%20orders%20in%20Brazil/soluções.sql)