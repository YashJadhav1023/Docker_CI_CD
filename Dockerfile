FROM python:3.9-slim
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install prometheus-fastapi-instrumentator


# It takes everything inside the 'app' folder and puts it in the container's '/app'
COPY ./app . 

RUN mkdir -p data

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
