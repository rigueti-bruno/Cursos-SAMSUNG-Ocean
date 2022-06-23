# Carregando as Extensões:
import sqlalchemy
from sqlalchemy import create_engine
import pymysql

# Cria a Conexão com o Banco de Dados:

url = 'mysql+pymysql://root:Brb1508.@127.0.0.1/escola' # define o acesso ao MySQL

# mysql+pymysql:// - referência ao tipo de banco de dados MySQL
# root - usuário/login no SGBD
# Brb1508. - senha do usuário
# @127.0.0.1 - IP do Host no SGBD
# /escola - referência do banco de dados


engine = create_engine(url, echo=True) # cria a Conexão

con = engine.connect() # executa a conexão

# Fazendo uma Consulta ao MySQL:

consulta = """SELECT * FROM aluno_ocean
                          INNER JOIN curso
                          ON aluno_ocean.id = curso.id_aluno""" # executa o Join das tabelas e puxa seus dados

# Transformando a Consulta em um Dataframe do Pandas:

import pandas as pd

df = pd.read_sql(consulta, con) # importa a tabela direto do MySQL a partir da variável da consulta executada

print(df) # Imprime a Tabela

df.to_csv('join.csv') # exporta o JOIN para um arquivo .csv