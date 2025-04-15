FROM python:3.10-slim
RUN useradd -m appuser
WORKDIR /home/appuser/app
COPY --chown=appuser:appuser . .
RUN pip install --no-cache-dir -r requirements.txt
USER appuser
EXPOSE 8080
CMD ["python", "main.py"]

