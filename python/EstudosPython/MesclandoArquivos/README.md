# Mesclando Arquivos de Vendas

## Sobre o Projeto

Este script Python foi desenvolvido para consolidar múltiplos arquivos CSV de vendas em um único arquivo. Ele automatiza o processo de unificação de dados que estão separados por períodos, incluindo a data da venda como informação adicional.

## Funcionalidades

- Busca automática de arquivos de vendas com padrão de nomenclatura específico
- Extração da data a partir do nome do arquivo
- Adição da data como coluna nos dados
- Consolidação de múltiplos arquivos em um único DataFrame
- Geração de arquivo de saída com timestamp atual

## Como Funciona

1. O script procura na pasta `raw` por todos os arquivos que seguem o padrão `vendas_*.csv`
2. Para cada arquivo encontrado:
   - Extrai a data do nome do arquivo
   - Carrega os dados em um DataFrame
   - Adiciona uma coluna com a data da venda
3. Concatena todos os DataFrames em um único conjunto de dados
4. Salva o resultado em um novo arquivo CSV com a data atual no nome


## Uso

1. Coloque seus arquivos CSV na pasta `raw`
2. Execute o script:
   ```
   python main.py
   ```
3. O arquivo consolidado será gerado na pasta raiz com o nome `vendas_consolidadas_YYYY-MM-DD.csv`

## Estrutura do Arquivo de Saída

O arquivo CSV final conterá todas as colunas originais dos arquivos de entrada, mais a coluna adicional:

- `data_venda`: Data extraída do nome do arquivo original

## Notas

- Se já existir um arquivo de saída com o mesmo nome, ele será substituído
- A codificação utilizada para o arquivo de saída é Latin-1 (ISO-8859-1) 