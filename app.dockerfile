# Run ´docker run --name mycontainer -p 8000:8000 app:latest´

FROM python:3.11-alpine

RUN pip install uv

WORKDIR /

COPY main.py main.py
COPY uv.lock uv.lock
COPY pyproject.toml pyproject.toml
COPY README.md README.md
COPY test_main.py test_main.py

RUN uv sync --locked --no-cache --no-install-project

EXPOSE 8000

CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]