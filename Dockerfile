FROM python:3.11-alpine3.23

# Create a non-root user with the UID Choreo requested
# The -D flag stands for "disabled password," which is exactly what you want for a system user
RUN adduser -D -u 10014 choreouser

WORKDIR /app
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=10014:10014 . .

USER 10014

RUN python -m compileall .

CMD ["python3", "./main.py"]