import os
from flask import Flask, g
import sqlite3
app = Flask(__name__)

app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'users.db'),
    SECRET_KEY='development key',
    USERNAME='admin',
    PASSWORD='default'
))

@app.route('/')
def hello_world():
    return 'http://127.0.0.1:5000/users/'

def connect_db():
    """Connects to the specific database."""
    rv = sqlite3.connect(app.config['DATABASE'])
    rv.row_factory = sqlite3.Row
    return rv

def get_db():
    """Opens a new database connection if there is none yet for the
    current application context.
    """
    if not hasattr(g, 'sqlite_db'):
        g.sqlite_db = connect_db()
    return g.sqlite_db

@app.teardown_appcontext
def close_db(error):
    """Closes the database again at the end of the request."""
    if hasattr(g, 'sqlite_db'):
        g.sqlite_db.close()

def init_db():
    db = get_db()
    with app.open_resource('init_db.sql', mode='r') as f:
        db.cursor().executescript(f.read())
    db.commit()

@app.cli.command('initdb')
def initdb_command():
    """Initializes the database."""
    init_db()
    print('Initialized the database.')

@app.route('/users/')
def show_entries():
    db = get_db()
    cur = db.execute('select id, name, email, card_number from users where status = "AKTIVEN"')
    users = cur.fetchall()
    res = ""
    for user in users:
      res += "name: " + user[1] + ", email: " + user[2] + ", card number: " + user[3] + "<br>"
    return res