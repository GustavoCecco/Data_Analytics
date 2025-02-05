# Projeto - Fase 1

Esse documento tem como objetivo fornecer dicas e diretrizes para que você desenvolva a Fase 1 do projeto da disciplina.

## Parte 1: Coleta de Dados

Para a fase 1 do projeto você deverá realizar coleta de dados de duas fontes distintas:

* API REST: Na API você vai encontrar informações sobre os países. Alguns exemplos dessas informações são: nome, população, nome da capital e área.
* Arquivo CSV: No arquivo CSV você vai encontrar as informações sobre o produto interno bruto dos países (PIB) corrigidos para a cotação do dolar atual.

A seguir temos mais detalhes sobre como realizar a coleta de dados em cada um desses arquivos.

### API REST

Para realizar essa parte do projeto você vai precisar rodar a API REST que está implementada no script `api_fase01.py`.

Primeiro é necessário ter um ambiente virtual conda ativo com as bibliotecas flask e flask_restful instaladas.
Para instalar essas libs, você pode utilizar o comando pip abaixo.

```
pip install flask flask_restful
```

Após ter essas bibliotecas instaladas você deverá executar o scritp que cria a api rest. Para isso você deverá executar o seguinte comando:

```
python api_fase01.py
```

Ao fazer isso você deve ter uma API REST rodando no seu computador. 
Você deve coletar dados de todos os países disponíveis nessa API. 
O uso da biblioteca requests, da biblioteca json e do pandas podem ser uteis para realizar essa tarefa.


### Arquivo CSV

Para realizar a leitura dos dados do arquivo CSV sinta-se a vontade para utilizar seu método favorito. 
A forma recomendada de se fazer isso é utilizando a biblioteca pandas.

## Parte 2: Consolidação dos Dados

Os dados que você obteve dos países precisam ser consolidados em um único dataframe para que você possa gerar um CSV com todas as informações.

**Dica:** Verifique alguma coluna (atributo) que você tem dos países que é comum nos dados obtidos das duas fontes de dados trabalhadas. Depois disso você deve ser capaz de consolidar os dados em um único dataframe usando a função `pd.concat` do pandas.