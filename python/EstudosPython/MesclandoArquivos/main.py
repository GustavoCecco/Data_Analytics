import os  # Importa o módulo para operações do sistema operacional
import pandas as pd  # Importa a biblioteca pandas para manipulação de dados
from glob import glob  # Importa a função glob para encontrar arquivos usando padrões
from datetime import datetime  # Importa datetime para trabalhar com datas e horas


# Busca todos os arquivos CSV que seguem o padrão 'vendas_*.csv' na pasta 'raw'
arquivos = glob('raw/vendas_*.csv')

# Lista vazia para armazenar os DataFrames de cada arquivo
dados_consolidados = []


for arquivo in arquivos:
    # Extrai a data do nome do arquivo (assumindo que o formato é 'vendas_DATA.csv')
    data_str = os.path.basename(arquivo).split('_')[1].replace('.csv', '')
    
    # Lê o arquivo CSV para um DataFrame
    df = pd.read_csv(arquivo)
    
    # Adiciona uma coluna 'data_venda' com a data extraída do nome do arquivo
    df['data_venda'] = data_str
    
    # Adiciona o DataFrame processado à lista de dados consolidados
    dados_consolidados.append(df)


# Concatena todos os DataFrames em um único DataFrame final
df_final = pd.concat(dados_consolidados, ignore_index=True)


# Obtém a data atual no formato 'YYYY-MM-DD'
timestamp = datetime.now().strftime("%Y-%m-%d")

# Cria o nome do arquivo de saída com a data atual
nome_saida = f"vendas_consolidadas_{timestamp}.csv"

# Verifica se já existe um arquivo com esse nome e o remove se existir
if os.path.exists(nome_saida):
    os.remove(nome_saida)

# Salva o DataFrame final em um arquivo CSV, sem índice e com codificação Latin-1
df_final.to_csv(nome_saida, index=False, encoding='latin1')