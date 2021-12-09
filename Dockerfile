FROM python:3.9.9-alpine
MAINTAINER Vadym

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

#RUN pip install poetry
#RUN poetry add Django==3.2.10
#RUN poetry add djangorestframework==3.12.4

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user