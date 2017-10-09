Инструкция тестировалась на докер-контейнере из образа ubuntu.
apt-get update

apt-get install python

apt-get install python-pip

pip install Flask


Команды далее выполнять из директории с проектом:

export FLASK_APP=app.py

flask initdb

flask run

Веб-приложение доступно по адресу http://127.0.0.1:5000
