from flask import Flask, render_template, request, redirect, url_for, session, flash
from authlib.integrations.flask_client import OAuth
from flask_mysqldb import MySQL
from datetime import timedelta


app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret key'
app.config['MYSQL_HOST'] = ''
app.config['MYSQL_USER'] = ''
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'dbp3'
app.permanent_session_lifetime = timedelta(minutes=5)

mysql = MySQL(app)
oauth = OAuth(app)


google = oauth.register(
     'google',
     client_id='370530652194-3a1gs1npalma1efqqi4k9h5rrsqo90n1.apps.googleusercontent.com',
     client_secret='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',
     access_token_url='https://accounts.google.com/o/oauth2/token',
     authorize_url='https://accounts.google.com/o/oauth2/auth',
     authorize_params=None,
     access_token_params=None,
     refresh_token_url=None,
     redirect_uri='http://bsiaw-projekt.switzerlandnorth.cloudapp.azure.com/login/authorized',
     client_kwargs={'scope': 'openid profile email'},
     jwks_uri='https://accounts.google.com/.well-known/openid-configuration'

)



@app.route('/login')
def login_google():
    redirect_uri = url_for('authorized', _external=True)
    return google.authorize_redirect(redirect_uri)

@app.route('/login/authorized')
def authorized():
    token = google.authorize_access_token()
    resp = google.get('https://www.googleapis.com/oauth2/v2/userinfo')
    user_info = resp.json()

    session['google_token'] = token['access_token']
    session['user_email'] = user_info['email']
    session['user_name'] = user_info['name']
    session['user_id'] = user_info['id']
    session['loggedin'] = True

    cur = mysql.connection.cursor()
    query = """INSERT INTO user (id_user, nazwa, email, sub, dodatkowe_informacje, status) 
               VALUES (%s, %s, %s, %s, %s, %s) ON DUPLICATE KEY UPDATE nazwa=VALUES(nazwa), email=VALUES(email)"""

    id_user = session['user_id']
    nazwa = session['user_name']
    email = session['user_email']
    sub = ""  
    dodatkowe_informacje = ""
    status = 0

    cur.execute(query, (id_user, nazwa, email, sub, dodatkowe_informacje, status))
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('index'))

"""
    
#Old way to login without using SSO 
"""
@app.route('/login-traditional', methods=['GET', 'POST'])
def login_traditional():
    msg = ''
    if request.method == 'POST' and 'username' in request.form:
        username = request.form['username']
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM user WHERE nazwa = % s', (username, ))
        account = cursor.fetchone()
        print(account)

        if account:
            session['loggedin'] = True
            session['nazwa'] = account[1]
            session['id_user'] = account[0]
            msg = 'Logged in successfully !'
            return redirect("/")
        else:
            msg = 'Incorrect username !'

    return render_template('login.html', msg=msg)


@app.route("/", methods=["GET", "POST"])
def index():

    cur = mysql.connection.cursor()
    cur.execute("SELECT nazwa from tagi")
    tags = cur.fetchall()
    cur.close()


    if request.method == 'GET':
        cur = mysql.connection.cursor()

        cur.execute("SELECT nazwa FROM skladniki")

        results = cur.fetchall()

        cur.close()

        return render_template('index.html', results=results, tags=tags)

    if request.method == 'POST':

        selected_ingredients = request.form.getlist('ingr')
        selected_ingredients_string = ",".join(selected_ingredients)
        selected_ingredients2 = request.form.get('ingr2')
        selected_recipes = request.form.get('recipe_name')
        selected_tags = request.form.get('ingr3')


        cur = mysql.connection.cursor()

        query = 'CALL przepisy_na_podstawie_podanych_skladników(%s)'
        query_recipe_name='CALL szukanie_po_nazwach(%s)'
        query_tags = 'CALL szukaj_po_tagu(%s)'

        if selected_ingredients:            
            cur.execute(query, (selected_ingredients_string,))

        elif selected_ingredients2:
            print("hello")
            ingredients = selected_ingredients2.split()

            # Join the ingredients with a comma and no whitespace
            ingredients_string = ",".join(ingredients)

            cur.execute(query, [ingredients_string])

        elif selected_recipes:

            selected_recipes = request.form.get('recipe_name')
        
            return redirect(url_for('przepisy_nazwa', selected_recipes=selected_recipes, **request.args))
    
        elif selected_tags:
            cur.execute(query_tags, [selected_tags]) 
            tagi = cur.fetchall()
            return render_template('tagi.html', tagi=tagi)

        results2 = cur.fetchall()
        print(results2)
       
        cur.close() 
    return render_template('index.html', results2=results2)

@app.route('/<selected_recipes>przepisy-nazwa.html', methods =['GET'])
def przepisy_nazwa(selected_recipes):

    print(selected_recipes)

    cur = mysql.connection.cursor()

    query_recipe_name='CALL szukanie_po_nazwach(%s)'

    cur.execute(query_recipe_name, (selected_recipes,))


    results3 = cur.fetchall()

    cur.close()
    
    return render_template('przepisy-nazwa.html', results3=results3)

@app.route('/tagi', methods =['GET'])
def tagi():
    print(tagi)
    return "Hello"

@app.route('/<selected_recipe>skladniki2', methods=["GET", "POST"])
def recipe_skladniki2(selected_recipe):
    
    int_selected_recipe = int(selected_recipe)
    print(int_selected_recipe)
    
    cur = mysql.connection.cursor()

    query = 'CALL skladniki_dla_przepisuid(%s)'

    cur.execute(query, (selected_recipe, ))

    results = cur.fetchall()

    cur.close()

    return render_template('skladniki2.html', results=results)

@app.route('/<selected_recipe>skladniki', methods=["GET", "POST"])
def recipe_skladniki(selected_recipe):
    
    user_id = session['id_user']
    int_selected_recipe = int(selected_recipe)
    print(int_selected_recipe)
    
    cur = mysql.connection.cursor()

    query = 'CALL skladniki_dla_przepisuid(%s)'

    cur.execute(query, (selected_recipe, ))

    results = cur.fetchall()

    cur.close()

    cur2 = mysql.connection.cursor()

    query_2 = """ SELECT skladniki.nazwa AS nazwa_skladnika,
            CASE WHEN user_has_skladniki.skladniki_id_skladniki IS NOT NULL THEN 'posiadasz składnik' ELSE 'nie posiadasz' END AS posiada
    FROM przepisy
    JOIN przepisy_has_skladniki ON przepisy.id_przepis = przepisy_has_skladniki.przepisy_id_przepis
    JOIN skladniki ON przepisy_has_skladniki.skladniki_id_skladniki = skladniki.id_skladniki
    LEFT JOIN user_has_skladniki ON skladniki.id_skladniki = user_has_skladniki.skladniki_id_skladniki
    AND user_has_skladniki.user_id_user = %s
    WHERE przepisy.id_przepis = %s """ 

    cur2.execute(query_2, (user_id, int_selected_recipe))

    results2 = cur2.fetchall()

    cur2.close()

    ingr_przepis = []
    for row in results:
        ingr_przepis.append(row[0])
        
    ingr_user = []
    for row in results2:
        if row[1] == 'nie posiadasz':
            ingr_user.append(row[0])

    print("przepis", ingr_przepis)
    print("user", ingr_user)

    return render_template('skladniki.html', results=results, results2=results2, ingr_przepis=ingr_przepis, ingr_user=ingr_user)

@app.route('/usun>', methods = ['POST'])
def usun():
    
    user_id = session['user_id']


    cur = mysql.connection.cursor()

    query = 'CALL usuwanie_uzytkownikaa(%s)'

    cur.execute(query, (user_id, ))

    mysql.connection.commit()

    cur.close()
    flash('Użytkownik został usunięty.', 'success')

    return redirect(url_for('index'))


@app.route('/recenzje', methods =['GET'])
def recenzje():

    cur = mysql.connection.cursor()

    cur.execute("SELECT id_przepis, nazwa FROM przepisy")

    results = cur.fetchall()

    cur.close()
    
    return render_template('recenzje.html', results=results)
    
@app.route('/<selected_recipe>recenzja-przepis.html', methods =['GET', 'POST'])
def recenzje_przepis(selected_recipe):


    if request.method == 'GET':
        cur = mysql.connection.cursor()

        query = "SELECT * FROM recenzje WHERE przepisy_id_przepis = %s" 

        cur.execute(query, (selected_recipe,))

        reviews = cur.fetchall()

        cur.close()

        return render_template('recenzja-przepis.html', reviews=reviews)
    
    if request.method == 'POST':
        
        if 'submit_button' in request.form:

            ocena = request.form['options']
            tresc = request.form['tresc']
            user_id = session['user_id']


            print(ocena)

            int_selected_recipe = int(selected_recipe)
            int_ocena = int(ocena)

            cur = mysql.connection.cursor()

            query = 'INSERT INTO recenzje (przepisy_id_przepis, user_id_user, recenzja, ocena_user, ilosc_zglaszen) VALUES (%s, %s, %s, %s, %s)'

            cur.execute(query, (int_selected_recipe, user_id, tresc, int_ocena, 0))

            mysql.connection.commit()

            cur.close()
            flash('Ocena została dodana.', 'success')

            return redirect(url_for('index'))


@app.route('/<reported_user><selected_przepis>zglos', methods =['GET', 'POST'])
def zglos(reported_user, selected_przepis):

    if request.method == 'GET':

        print(reported_user, type(reported_user))
        print(selected_przepis, type(selected_przepis))
        
        return render_template('zglos.html')
    
    if request.method == 'POST':

        tresc = request.form['report']
        int_selected_przepis = int(selected_przepis)

        cur = mysql.connection.cursor()

        query = 'INSERT INTO zgloszenia (recenzje_przepisy_id_przepis, recenzje_user_id_user, user_id_user, tresc) VALUES (%s, %s, %s, %s)'

        cur.execute(query, (int_selected_przepis, reported_user, reported_user, tresc))

        mysql.connection.commit()

        cur.close()
        flash('Komentarz został zgłoszony.', 'success')

        return redirect(url_for('index'))

@app.route('/login', methods =['GET', 'POST'])
def login():
    msg = ''
    if request.method == 'POST' and 'username' in request.form:

        username = request.form['username']
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM user WHERE nazwa = % s', (username, ))
        account = cursor.fetchone()
        print(account)

        if account:
            session['loggedin'] = True
            session['nazwa'] = account[1]
            session['id_user'] = account[0]
            msg = 'Logged in successfully !'
            return redirect("/")
        else:
            msg = 'Incorrect username !'

    return render_template('login.html', msg = msg)

@app.route('/logout')
def logout():
    # Removing session key
    session.pop('google_token', None)
    session.pop('loggedin', None)
    session.pop('id_user', None)
    session.pop('nazwa', None)
    session.pop('user_email', None)
    session.pop('user_name', None)
    session.pop('user_id', None)
    session.clear()
    
    # Redirecting to main site
    return redirect(url_for('index'))

def fetch_lodowka_data(user_id):
    cur = mysql.connection.cursor()
    query = 'CALL przepisy_na_podstawie_inventory(%s)'
    cur.execute(query, (user_id,))
    results = cur.fetchall()
    cur.close()

    cur2 = mysql.connection.cursor()
    query2 = 'CALL pokaz_skladniki_uzytkownika(%s)'
    cur2.execute(query2, (user_id,))
    results2 = cur2.fetchall()
    cur2.close()

    cur3 = mysql.connection.cursor()
    cur3.execute("SELECT nazwa FROM skladniki")
    results3 = cur3.fetchall()
    cur3.close()

    return results, results2, results3

@app.route("/lodowka", methods=['GET', 'POST'])
def lodowka():
    if 'user_id' not in session or session['user_id'] is None:
       return redirect(url_for('login'))
    
    user_id = session['user_id']
    results, results2, results3 = fetch_lodowka_data(user_id)

    if request.method == 'POST':
        selected_ingredients = request.form.getlist('ingr')
        string_selected_ingredients = ",".join(selected_ingredients)
        
        cur = mysql.connection.cursor()
        query = "CALL dodaj_skladnik_do_inventory(%s, %s, %s)"
        cur.execute(query, (user_id, [string_selected_ingredients], 0))
        mysql.connection.commit()
        cur.close()

        results, results2, results3 = fetch_lodowka_data(user_id)

    return render_template('lodowka.html', results=results, results2=results2, results3=results3)

@app.route('/usun_skladnik/<ingredient>', methods=['GET'])
def usun_skladnik(ingredient):
    user_id = session['user_id']
    
    cur = mysql.connection.cursor()
    query = 'CALL usun_skladnik_z_inventory(%s, %s)'
    cur.execute(query, (user_id, ingredient))
    mysql.connection.commit()
    cur.close()

    results, results2, results3 = fetch_lodowka_data(user_id)
    return redirect(url_for('lodowka'))




@app.route("/przepisy", methods=["GET"])
def top10():

    cur = mysql.connection.cursor()

    cur.execute("SELECT * FROM top_10_przepisow_wg_oceny")


    results = cur.fetchall()

    cur.close()

    return render_template('top10.html', results=results)


if __name__ == "__main__":
    app.run()
