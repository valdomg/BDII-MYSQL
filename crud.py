import mysql.connector
#Conexão
try:
    mysqlConnection = mysql.connector.connect(
        host = 'localhost',
        database = 'lojatech',
        user = 'VALDEMIRO',
        password = 'valdom'
    )
    cursor = mysqlConnection.cursor()
    print('Conexão bem sucedida')

except mysql as error:
    print(f"Failed to acess tables in MySQL: {error}")

#finally:
#    if mysql.is_connected():
#        cursor.close()
#        mysql.close()
#        print("MySQL connection is closed")

#Criar
def criarTabela():
    try:
        
        cursor.execute('''CREATE TABLE administrador(
                        idADM INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        nomeADM VARCHAR (50) NOT NULL,
                        email VARCHAR(30) NOT NULL,
                        senha VARCHAR (10) NOT NULL
                    )''')
        print('Tabela criada com sucesso')

    except mysqlConnection as error:
        print(f"Failed to create table in MySQL: {error}")


#Editar
def editarTabelaUsuario(nomeColuna, novoDado, idUsuario):
    try:
        cursor.execute(f'''
                    UPDATE usuario 
                    SET {nomeColuna} = '{novoDado}'
                    WHERE idusuario = {idUsuario};
                    ''')
        mysqlConnection.commit()
        print('Dado alterado')
        
    except mysqlConnection as error:
        print(f"Failed to update table in MySQL: {error}")




#Deletar
def deletarRegistroTabelaUsuario(idUsuario):
    try:
        cursor.execute(
            f'''
               DELETE FROM usuario
               WHERE idusuario = {idUsuario};
        ''')
        return True
    except mysqlConnection as error:
        print(f"Failed to delete register in MySQL: {error}")

    
#Mostrar
def mostrarTabelaProduto():
    try:
        cursor.execute('SELECT * FROM produto')
        dados = cursor.fetchall()
        return dados

    except mysqlConnection as error:
        print(f"Failed to read table in MySQL: {error}")

   

def mostrarTabelaUsuario():
    try:
        cursor.execute('SELECT * FROM usuario')
        dados = cursor.fetchall()
        return dados

    except mysqlConnection as error:
        print(f"Failed to read table in MySQL: {error}")

deletarRegistroTabelaUsuario(6)

print(mostrarTabelaUsuario())

cursor.close()

