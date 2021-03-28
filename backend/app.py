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
thumbnailUrl = ["http://localhost:5000/static/d.jpeg", "https://http.cat/102", "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg", "https://vignette.wikia.nocookie.net/breakingbad/images/9/95/JesseS5.jpg/revision/latest?cb=20120620012441", "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg"]

array = []
for b,c,d in zip(id,title,thumbnailUrl):
    array.append({'id': b, 'title': c, 'thumbnailUrl': d})

@app.route('/')
def hello_world():
    return jsonify(array)

@app.route('/dropChat')
def dropChat():
    conn = sqlite3.connect('app.db')
    c = conn.cursor()
    # Execute the DROP Table SQL statement
    dropTableStatement = "DROP TABLE chat"
    c.execute(dropTableStatement)
    # Close the connection object
    conn.close()
    return "True"


@app.route('/dropUsers')
def dropUsers():
    conn = sqlite3.connect('app.db')
    c = conn.cursor()
    # Execute the DROP Table SQL statement
    dropTableStatement = "DROP TABLE users"
    c.execute(dropTableStatement)
    # Close the connection object
    conn.close()
    return "True"

@app.route('/createTable', methods=["POST", "GET"])
def createTable():
    conn = sqlite3.connect('app.db')
    c = conn.cursor()
    c.execute("""CREATE TABLE IF NOT EXISTS users (username text PRIMARY KEY,password text NOT NULL, dogName text NOT NULL, size text NOT NULL, bio text NOT NULL, age text NOT NULL, city text NOT NULL, breed text NOT NULL); """)
    conn.commit()
    conn.close()
    return jsonify(success=True)

@app.route('/createChat', methods=["POST", "GET"])
def createChat():
    conn = sqlite3.connect('app.db')
    c = conn.cursor()
    c.execute("""CREATE TABLE IF NOT EXISTS chat (chat_id INTEGER PRIMARY KEY,user1 text NOT NULL, user2 text NOT NULL); """)
    conn.commit()
    conn.close()
    return jsonify(success=True)


@app.route('/login', methods=["POST", "GET"])
def login():
    username = request.form.get('username')
    password = request.form.get('password')
    conn = sqlite3.connect('app.db')
    c = conn.cursor()
    find_user = ("SELECT * FROM users WHERE username = ? AND password = ?")
    c.execute(find_user,[(username),(password)])
    results = c.fetchall()
    # results = dict(c.fetchall())
    if not results:
        results = "False"
    else:
        results = "True"
    conn.close()
    return results

@app.route('/')

@app.route('/chat', methods=["POST", "GET"])
def chat():
    user1 = request.form.get('user1','')
    user2 = request.form.get('user2','')
    conn = sqlite3.connect('app.db')
    c = conn.cursor()
    c.execute("INSERT INTO chat(user1,user2) VALUES (?, ?)", (user1,user2,))
    conn.commit()
    conn.close()
    return "True"

@app.route('/getChat', methods=["POST", "GET"])
def getChat():
    username = request.form.get('username','')
    conn = sqlite3.connect('app.db')
    c = conn.cursor()
    query = ("SELECT * FROM chat WHERE user1 = ? OR user2 = ?")
    c.execute(query, (username,username,))
    results = c.fetchall()
    # for row in results:
    #     print(row[1], file=sys.stderr)
    conn.close()
    return jsonify(results)

@app.route('/add', methods=["POST", "GET"])
def add():
    username = request.args.get('username')
    password = request.args.get('password')
    conn = sqlite3.connect('app.db')
    c = conn.cursor()
    c.execute("INSERT INTO users VALUES (?, ?)", (username,password,))
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
        username = request.form.get('user','')
        password = request.form.get('pass','')
        print(user, file=sys.stdout)
        print(num, file=sys.stdout)
        conn = sqlite3.connect('employee.db')
        c = conn.cursor()
        c.execute("INSERT INTO users VALUES (?, ?)", (user,password,))
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

@app.route('/addDummyData', methods=['POST', "GET"])
def addDummyData():
    conn = sqlite3.connect('app.db')
    c = conn.cursor()
    c.execute("INSERT INTO users VALUES (?,?,?,?,?,?,?,?)", ("CilantroDumplings", "ttMDGQAYhK", "Cilantro", "Large", "Biggest, goofball around and loves to meet new people", "7", "Fullerton", "Bloodhound Mix",))
    c.execute("INSERT INTO users VALUES (?,?,?,?,?,?,?,?)", ("Zodthegod", "TdDocXNxvW", "Zodie", "Large", "Very energetic and loves being outdoors, well-trained and loves to learn", "11", "Fullerton", "Border Collie",))
    c.execute("INSERT INTO users VALUES (?,?,?,?,?,?,?,?)", ("PanDulce", "stFQp9aoc0", "Conchita", "Small", "Small, but mighty and loves to be buried under a blanket", "<1", "Long Beach", "Chihuahua Mix",))
    conn.commit()
    conn.close()
    return jsonify(success=True)

