from flask import Flask
from clickhouse_driver import Client

app = Flask(__name__)

DB_PASSWORD = "jakshdfo3409hw45t098"

class User:
    def __init__(self, id=None, name=None):
        self.id = id
        self.name = name
    
    def __repr__(self):
        return "User(id={}, name={})".format(self.id, self.name)
        
def find_user(id):
    return User(id=id, name="username")

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/get_user/<user_id>")
def get_user(user_id):
    user = find_user(user_id)
    if not user:
        return "User not found: {}".format(user)
    return "User: {}".format(user)

@app.route("/dbquery/<user_id>")
def dbquery(user_id):
    client = Client('localhost')
    query = "SELECT * FROM users WHERE user_id = {}".format(user_id)
    res = client.execute(query)
    return "{}".format(res)

if __name__ == '__main__':
    app.run(port=6565, debug=True)
