import sqlite3
from flask import Flask, g, render_template

app = Flask(__name__)

### Database cruft ripped from the Flask tutorial: http://flask.pocoo.org/docs/0.10/tutorial/

def connect_db():
    return sqlite3.connect("mira.db")

@app.before_request
def before_request():
    g.db = connect_db()
    g.db.row_factory = sqlite3.Row

@app.teardown_request
def teardown_request(exception):
    db = getattr(g, 'db', None)
    if db is not None:
        db.close()


@app.route('/topic/<int:topic_id>')
def list(topic_id):
	links = g.db.execute("SELECT * FROM links ORDER BY id ASC")
	return render_template('list.html', entries=links)

if __name__ == '__main__':
    app.run(debug=True)
