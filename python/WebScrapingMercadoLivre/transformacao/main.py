import pandas as pd
import sqlite3
from datetime import datetime


df = pd.read_json('data.json')

# Mostrar todas as colunas
pd.options.display.max_columns = None

# Criando colunas com informação de onde veio os dados e a data
df['_source'] = "https://lista.mercadolivre.com.br/notebook"
df['_datetime'] = datetime.now()


# Tratar nulos
df['old_money'] = df['old_money'].fillna('0')
df['new_money'] = df['new_money'].fillna('0')
df['reviews_rating_number'] = df['reviews_rating_number'].fillna('0')
df['reviews_amount'] = df['reviews_amount'].fillna('(0)')

# Limpando os dados
df['old_money'] = df['old_money'].astype(str).str.replace('.','', regex=False)
df['new_money'] = df['new_money'].astype(str).str.replace('.','', regex=False)
df['reviews_amount'] = df['reviews_amount'].astype(str).str.replace('[\\()]', '', regex=True)


# Converter para números
df['old_money'] = df['old_money'].astype(float)
df['new_money'] = df['new_money'].astype(float)
df['reviews_rating_number'] = df['reviews_rating_number'].astype(float)
df['reviews_amount'] = df['reviews_amount'].astype(int)


# Manter apenas produtos com preço entre 1000 e 10000 reais

df = df[
    (df['old_money'] >= 1000) & (df['old_money'] <= 10000) & 
    (df['new_money'] >= 1000) & (df['new_money'] <= 10000)
]

# Conexão com o banco de dados para salvar 
conn = sqlite3.connect('mercadolivre.sql')
df.to_sql('notebook', conn, if_exists='replace', index=False)

conn.close()