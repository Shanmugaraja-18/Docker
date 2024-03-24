FROM python:3.8-buster

WORKDIR /app

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
