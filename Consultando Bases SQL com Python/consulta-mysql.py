# Carregando as Extensões:
import sqlalchemy
from sqlalchemy import create_engine
import pymysql

# Cria a Conexão com o Banco de Dados:

url = 'mysql+pymysql://root:Brb1508.@127.0.0.1/escola' # define o acesso ao MySQL

engine = create_engine(url, echo=True) # cria a Conexão

con = engine.connect() # executa a conexão

# Fazendo uma Consulta ao MySQL:
res = con.execute('SELECT * FROM curso') # puxa todos os dados da tabela

# Imprime o Resultado da Consulta:
print(list(res)) # imprime todos os registros da tabela

# Transformando a Consulta em um Dataframe do Pandas:
import pandas as pd

df = pd.read_sql('curso', con) # importa a tabela direto do MySQL

print(df) # Imprime a Tabela

# Exportando a Tabela como .csv:

df.to_csv('Tabela_Cursox.csv')