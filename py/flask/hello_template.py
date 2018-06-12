#!/usr/bin/python
# -*- encoding: utf-8 -*-

from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello!'

@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello1.html', name=name)

if __name__ == '__main__':
    app.run(host='0.0.0.0')
