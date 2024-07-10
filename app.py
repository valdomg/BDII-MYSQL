from flask import Flask, render_template, redirect, request, session, url_for

import mysql.connector

app = Flask (__name__)
app.config ['MYSQL_HOST'] = 'localhost'
app.config ['MYSQL_USER'] = 'VALDEMIRO'
app.config ['MYSQL_PASSWORD'] = 'valdom'
app.config ['MYSQL_DB'] = 'lojatech'

mysqlConnection = mysql.connector.connect(
    host=app.config['MYSQL_HOST'],
    user=app.config['MYSQL_USER'],
    password=app.config['MYSQL_PASSWORD'],
    database=app.config['MYSQL_DB']
    )

@app.route('/listar')
def home():
    cursor = mysqlConnection.cursor()
    cursor.execute('SELECT * FROM produto')
    data = cursor.fetchall()
    cursor.close()
    return render_template('home.html', data = data)


@app.route('/deletarProduto/<int:id>', methods = ['GET'])
def deletarProduto(id):
    cursor = mysqlConnection.cursor()
    cursor.execute('DELETE FROM produto WHERE idproduto = %d',(id))
    cursor.close()

    return redirect(url_for('home'))

  

@app.route('/', methods = ['GET', 'POST'])
def login():
    
    if request.method == 'POST':
        usuario = request.form ['username']
        senha = request.form['senha']
        cursor = mysqlConnection.cursor()
        cursor.execute('SELECT * FROM usuario WHERE nome_usuario = %s AND senha = %s', (usuario, senha))

        user = cursor.fetchone()
        cursor.close()

        if user:
            session['username'] = usuario
            return redirect('/listar')
        else:
            return 'Login inválido'
    
    return render_template('login.html')

@app.route('/loginAdministrador', methods = ['GET', 'POST'])
def loginAdm():

    if request.method == 'POST':
        emailAdm = request.form ['emailAdm']
        senha = request.form['senha']

        cursor = mysqlConnection.cursor()
        cursor.execute(f'''SELECT email, senha 
                           FROM administrador 
                           WHERE email = '{emailAdm}' and senha = '{senha}';''')

        userAdm = cursor.fetchone()
        cursor.close()

        if userAdm:
            session['nomeAdm'] = emailAdm
            #Provisório, é pra ir numa page separada
            return redirect('/listar')
        else:
            return 'Login Inválido'

    return render_template ('loginAdministrador.html')

if __name__ == '__main__':
    app.secret_key ='admin123'
    app.run(debug=True)
    