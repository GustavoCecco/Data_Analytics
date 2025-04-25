import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
import pandas as pd
import os


class ManipuladorExcel(FileSystemEventHandler):
    def arquivo_salvo(self, event):
        if event.src_path.endswith('.xlsx'):
            time.sleep(3)  # Espera o arquivo ser salvo totalmente

            try:

                # Lendo o arquivo
                df = pd.read_excel(event.src_path)

                # Excluindo colunas que não são necessárias
                colunas_excluidas = ['Supervisor', 'Equipe Vendas']
                df = df.drop(columns=[col for col in colunas_excluidas if col in df.columns])

                # Alterando valores ausentes das colunas abaixo para "Outros"
                df[['Grupo Produto', 'Linha Produto']] = df[['Grupo Produto', 'Linha Produto']].fillna('Outros')


                nome_saida = os.path.basename(event.src_path)
                df.to_excel(f'D:/Base/{nome_saida}', index=False)
            
            except Exception as e:
                print(f"Erro ao processar {event.src_path}: {e}")

# Caminho a ser monitorado
path = "D:/ArquivosOrigem"

observer = Observer()
observer.schedule(ManipuladorExcel(), path=path, recursive=False)
observer.start()


# A pasta fica sendo monitorada de 1 em 1 segundo
try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    observer.stop()
observer.join()