FROM python:3.9.9-alpine
MAINTAINER Vadym

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

#RUN pip install poetry
#RUN poetry add Django==3.2.10
#RUN poetry add djangorestframework==3.12.4

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user