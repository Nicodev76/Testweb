# Wir nutzen ein schlankes Python-Image
FROM python:3.12-slim

# Arbeitsverzeichnis festlegen
WORKDIR /app

# System-Abhängigkeiten für SQLite/Python installieren
RUN apt-get update && apt-get install -y --no-install-recommends gcc python3-dev && rm -rf /var/lib/apt/lists/*

# Zuerst nur requirements kopieren (für schnelleren Cache)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Den Rest des Codes kopieren
COPY . .

# Port freigeben (passend zu deiner main.py)
EXPOSE 80

# App starten
CMD ["python", "main.py"]