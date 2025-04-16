FROM python:3.11-slim

# Create non-root user
RUN useradd -m appuser

# Set working directory
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# Run as non-root
USER appuser

EXPOSE 5000

CMD ["python", "main.py"]

