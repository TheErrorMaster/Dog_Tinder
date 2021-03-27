from flask import Flask, jsonify, request, json
import sqlite3
import sys

app = Flask(__name__)

def connection_db():
    conn = None
    try:
        conn = sqlite3.connect('employee.db')
    except Error as e:
        print(e)
    return conn

id = [1,2,3,4,5]
title = ["marton", "samual", "marciano", "joakim", "tomislav" ]
thumbnailUrl = ["https://http.cat/101", "https://http.cat/102", "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg", "https://vignette.wikia.nocookie.net/breakingbad/images/9/95/JesseS5.jpg/revision/latest?cb=20120620012441", "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg"]

array = []
for b,c,d in zip(id,title,thumbnailUrl):
    array.append({'id': b, 'title': c, 'thumbnailUrl': d})

@app.route('/')
def hello_world():
    return jsonify(array)

@app.route('/createTable', methods=["POST", "GET"])
def createTable():
    conn = sqlite3.connect('employee.db')
    c = conn.cursor()
    c.execute("""CREATE TABLE IF NOT EXISTS users (id integer PRIMARY KEY,name text NOT NULL); """)
    conn.commit()
    conn.close()
    return jsonify(success=True)

@app.route('/login', methods=["POST", "GET"])
def login():
    username = request.form.get('user')
    password = request.form.get('num')
    conn = sqlite3.connect('employee.db')
    c = conn.cursor()
    find_user = ("SELECT * FROM users WHERE id = ? AND name = ?")
    c.execute(find_user,[(password),(username)])
    results = dict(c.fetchall())
    if not results:
        results = "False"
    else:
        results = "True"
    conn.close()
    return results

@app.route('/add', methods=["POST", "GET"])
def add():
    user = request.args.get('user')
    num = request.args.get('num')
    conn = sqlite3.connect('employee.db')
    c = conn.cursor()
    c.execute("INSERT INTO users VALUES (?, ?)", (num,user,))
    conn.commit()
    conn.close()
    return jsonify(success=True)


name = 'hello'
@app.route('/success')
def success():
    return 'welcome %s' % name


@app.route('/getForm', methods=["POST", "GET"])
def getForm():
    if request.method == 'POST':
        # this breaks the code if no form exist
        # user = request.form['user']
        # num = request.form['num']
        # this allows forms to be exempt
        user = request.form.get('user','')
        num = request.form.get('num','')
        print(user, file=sys.stdout)
        print(num, file=sys.stdout)
        conn = sqlite3.connect('employee.db')
        c = conn.cursor()
        c.execute("INSERT INTO users VALUES (?, ?)", (num,user,))
        conn.commit()
        c.close()
        return"it worked"
        # return jsonify(success=True)
    else:
        return jsonify(success=False)

# Post get json data 
@app.route('/getJson', methods=["POST", "GET"])
def getJson():
    if request.method == 'POST':
        rq = request.get_json()
        user = rq['user']
        num = rq['num']
        print(user, file=sys.stdout)
        print(num, file=sys.stdout)
        print(rq, file=sys.stdout)
        conn = sqlite3.connect('employee.db')
        c = conn.cursor()
        c.execute("INSERT INTO users VALUES (?, ?)", (num,user,))
        conn.commit()
        c.close()
        return jsonify(success=True)
    else:
        return jsonify(success=False)


@app.route('/getAll', methods=['POST', "GET"])
def getAll():
    # return jsonify({"id": 1, "title":"bro", "thumbnailUrl":"https://via.placeholder.com/150/771796"},{"id": 2, "title":"homie", "thumbnailUrl":"https://via.placeholder.com/150/771796"})
    return jsonify(array)