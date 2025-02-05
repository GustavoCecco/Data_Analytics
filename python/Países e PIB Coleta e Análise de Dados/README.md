# Coleta e Análise de Dados - Países e PIB

## Projeto - Fase 01

Nesta primeira fase do projeto, o objetivo é criar um conjunto de dados em formato CSV que contemple informações de países, moeda em circulação no país e Produto Interno Bruto (PIB ou GDP). As informações dos países e do PIB desses países estão em locais diferentes.

Para obter os dados dos países foi consumido uma API REST em Python. Os dados que devem ser obtidos dessa API são: Código, Nome, Código da Moeda, População, Capital e Área.

Para obter os dados do GDP (PIB) desde 1960 até 2021, você deverá ler as informações de um arquivo CSV. Verifique que para alguns países não temos disponível a informação de GDP para todos os anos, isso não é um problema, colete as informações disponíveis.

Disponibilizei os arquivos: api_fase01.py, country.json, gpd_data.csv e README.md. Para essa fase do projeto foi gerado dois arquivos:

Um arquivo CSV que possui uma linha para cada um dos países que constam na API e com as seguintes colunas: “codigo”, “nome”, “populacao”, “capital”, “area”, “continente” e "PIB" (uma coluna para cada um dos anos desde 1960 até 2021).
Um jupyter notebook que tem o processo de coleta de dados da API REST, leitura de dados do arquivo CSV e consolidação das informações em um único dataframe pandas.


## Projeto - Fase 02

Nesta segunda fase do projeto, vamos trabalhar um estudo de caso sobre saúde mental.  

Os objetivos serão: compreender o tema do estudo de caso, integrar bases de dados, limpar os dados e analisá-los com objetivo de responder às perguntas do estudo de caso. Os dados sobre produto interno bruto (PIB), obtidos na Fase 1 do projeto, serão utilizados para complementar as análises desta etapa. 

O estudo de caso utiliza dados coletados pela Open Sourcing Mental Illness (OSMI) (https://osmihelp.org/), que é uma ONG dedicada a conscientizar, educar e prover recursos para suportar pessoas com distúrbios mentais nas empresas de tecnologia e comunidades open source.
 
Problemas de saúde mental como ansiedade e depressão são prejudiciais ao bem-estar, estilo de vida, e produtividade das pessoas no local de trabalho. Segundo a Mental Health America, mais de 44 milhões de adultos nos EUA possuem uma condição de saúde mental. A saúde mental de colaboradores na indústria de tecnologia é de grande preocupação devido ao tipo de ambiente competitivo tipicamente encontrado nestas empresas. Portanto, o tema é de grande importância para gestores de empresas de tecnologia que precisam considerar investimentos nesta área. 

Anualmente, a OSMI conduz pesquisas que procuram mensurar as atitudes com relação a distúrbios mentais nas empresas de tecnologia e examinar a frequência de distúrbios mentais entre funcionários de tecnologia. Para este estudo de caso vamos utilizar os resultados das pesquisas realizadas entre 2016 e 2020. 


Objetivo deste estudo de caso é responder às seguintes perguntas: 


- Existe uma diferença significativa de saúde mental entre os gêneros de colaboradores ao longo do tempo em que a pesquisa foi realizada?
- Existe uma diferença significativa de quem busca tratamento entre os gêneros de colaboradores ao longo do tempo em que a pesquisa foi realizada?
- Existe uma diferença significativa de saúde mental entre as idades dos colaboradores ao longo do tempo em que a pesquisa foi realizada?
- Existe uma diferença significativa de quem busca tratamento entre as idades dos colaboradores ao longo do tempo em que a pesquisa foi realizada?
- Os funcionários de empresas que possuem benefícios de saúde para tratamento de saúde mental buscam mais tratamento?
- Existe uma diferença significativa de saúde mental entre países mais ricos (com um PIB elevado) no ano de 2016? 

Para responder às perguntas acima utilizei: 

Os arquivos analíticos de cada pesquisa anual disponibilizado no arquivo (pesquisas.zip, contendo os seguintes arquivos: 2016_f.csv, 2017_f.csv, 2018_f.csv, 2019_f.csv, 2020_f.csv; 
Combinar as bases de dados; 
Realizar a limpeza dos dados; 
Reduzir os dados; 
Transformar os dados; 
Tornar os dados discretos; 
Visualizar os dados. 

O resultado final foi um notebook jupyter com os passos aplicados para responder às perguntas de 1 a 6. 

