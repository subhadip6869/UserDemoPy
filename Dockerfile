FROM python:3.11-alpine3.23
WORKDIR /app
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python -m compileall .

CMD ["python3", "./main.py"]