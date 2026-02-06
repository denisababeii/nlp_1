# Curl command to test:
curl -X POST 'http://localhost:8000/v1/sentiment' -H 'accept: application/json' -H 'Content-Type: application/json' -d '{"text": "It was a good course."}'

# How to run FE: 
uv run uvicorn app:app --port 8001

# To build Docker image:
docker build -f app.dockerfile . -t app:latest

# To run container:
docker run --name mycontainer -p 8000:8000 app:latest

# To run tests:
uv run python test_main.py