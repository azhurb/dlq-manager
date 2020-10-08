import os
from flask import render_template
from app import app
from pymongo import MongoClient

app.config["DATABASE_URI"] = os.environ.get("DATABASE_URI")


@app.route('/')
def home():
    client = MongoClient(app.config["DATABASE_URI"])
    db = client.dlq
    collection = db.poisoned_messages
    return render_template('home.html', collection=collection)
