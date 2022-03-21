FROM python:3.8.2-alpine3.11

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 5000

CMD [ "flask", "run", "--host=0.0.0.0"]
