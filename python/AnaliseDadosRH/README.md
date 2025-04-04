# Análise de Dados de Recursos Humanos

## 📊 Sobre o Projeto

Uma empresa de consultoria que atua em Big Data e Data Science deseja contratar Cientistas de Dados entre pessoas que obtenham aprovação em alguns cursos ministrados pela empresa. Muitas pessoas se inscrevem para o treinamento. A empresa quer saber quais desses candidatos realmente querem trabalhar para a empresa após o treinamento ou estão apenas fazendo o treinamento para retornarem ao mercado à procura de um novo emprego. O objetivo é contratar  os profissionais com perfil adequado, a fim de reduzir o custo e o tempo decontratação, bem como a qualidade do treinamento ou planejamento dos cursos e categorização dos candidatos.

## 🎯 Objetivo

O objetivo será realizar um extenso trabalho de análise nos dados, compreender como estão organizados, realizar limpeza e transformação dos dados conforme necessário, detectar eventuais padrões e diagnósticos e ao final emitir um parecer com um resumo sobre os dados.

## 📋 Conjunto de Dados

O dataset contém as seguintes variáveis principais:

- **Variáveis Numéricas:**
  - `city_development_index`: Índice de desenvolvimento da cidade (0-1)
  - `training_hours`: Horas de treinamento
  - `experience`: Anos de experiência
  - `last_new_job`: Tempo desde o último emprego

- **Variáveis Categóricas:**
  - `gender`: Gênero
  - `relevent_experience`: Experiência relevante
  - `enrolled_university`: Status de matrícula universitária
  - `education_level`: Nível educacional
  - `major_discipline`: Área de formação
  - `company_type`: Tipo de empresa
  - `company_size`: Tamanho da empresa

- **Variável Target:**
  - `target`: Indica se o candidato mudou de emprego (1) ou não (0)

## 🔍 Principais Análises Realizadas

### 1. Análise Descritiva
- Estatísticas básicas das variáveis numéricas
- Distribuição das variáveis categóricas
- Identificação de valores ausentes

### 2. Análise de Distribuição
- Histogramas e boxplots para variáveis numéricas
- Teste de normalidade das distribuições
- Identificação de outliers e padrões

### 3. Análise de Correlação
- Matriz de correlação entre variáveis numéricas
- Identificação de relações significativas
- Análise de correlação com a variável target

### 4. Visualizações
- Histogramas para distribuição de dados
- Boxplots para análise de outliers
- Heatmap para correlações
- Gráficos de barras para variáveis categóricas

## 📈 Principais Descobertas

1. **Distribuição do CDI:**
   - Maioria dos candidatos vem de cidades bem desenvolvidas
   - Média de 0,828 e mediana de 0,903
   - Distribuição não normal

2. **Horas de Treinamento:**
   - Média de 65,37 horas
   - Mediana de 47 horas
   - Distribuição assimétrica à direita
   - Pouca influência na decisão de mudar de emprego

3. **Correlações Significativas:**
   - CDI e experiência: correlação positiva moderada (0,301)
   - CDI e target: correlação negativa moderada (-0,279)
   - Experiência e último emprego: correlação positiva moderada (0,473)

## 🛠️ Tecnologias Utilizadas

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook

## 📝 Conclusão

Este projeto demonstra a aplicação de técnicas de análise exploratória de dados em um contexto de recursos humanos, identificando padrões e relações importantes que podem auxiliar na compreensão dos fatores que influenciam a decisão de mudança de emprego. As análises realizadas fornecem insights valiosos para estratégias de retenção de talentos e recrutamento.
