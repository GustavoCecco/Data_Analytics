# Monitoramento e Processamento Automático de Arquivos Excel

Este script Python implementa um sistema de monitoramento automático de diretórios para processar arquivos Excel assim que são criados. É uma solução útil para automatizar o processamento de dados em planilhas Excel.

## Funcionalidades

- Monitora continuamente um diretório específico em busca de novos arquivos Excel (.xlsx)
- Processa automaticamente os arquivos assim que são criados
- Remove colunas desnecessárias (Supervisor e Equipe Vendas)
- Trata valores ausentes nas colunas 'Grupo Produto' e 'Linha Produto', substituindo-os por "Outros"
- Salva o arquivo processado em um diretório de saída

## Requisitos

Para executar este script, você precisará das seguintes bibliotecas Python:
```bash
pip install pandas
pip install watchdog
pip install openpyxl
```

## Como Usar

1. Configure os diretórios no script:
   - `path`: Diretório que será monitorado (atualmente configurado como "D:/ArquivosOrigem")
   - Diretório de saída: Atualmente configurado como "D:/Base"

2. Execute o script:
```bash
python main.py
```

3. O script continuará rodando e monitorando o diretório até ser interrompido (Ctrl+C)

## Casos de Uso

Este script é ideal para:
- Automação de processos de limpeza de dados em Excel
- Processamento em tempo real de planilhas recebidas
- Eliminação de tarefas manuais repetitivas de tratamento de dados
- Integração com sistemas que geram arquivos Excel automaticamente

## Estrutura do Código

- `ManipuladorExcel`: Classe que herda de `FileSystemEventHandler` para monitorar eventos de arquivo
- `arquivo_salvo`: Método que é acionado quando um novo arquivo é criado
- Sistema de tratamento de erros para garantir robustez
- Delay de 3 segundos após detecção do arquivo para garantir que o arquivo esteja completamente salvo

## Observações

- O script aguarda 3 segundos após detectar um novo arquivo para garantir que ele esteja completamente salvo
- O processamento é feito de forma assíncrona, permitindo monitorar múltiplos arquivos
- O script pode ser facilmente adaptado para incluir outras transformações de dados conforme necessário
