FROM tiangolo/uwsgi-nginx-flask:python3.7

ENV STATIC_URL /static

ENV STATIC_PATH /var/www/app/static

COPY ./requirements.txt /var/www/requirements.txt

RUN apt-get update && apt-get install -y ca-certificates

RUN pip install --upgrade pip

RUN pip install -r /var/www/requirements.txt
