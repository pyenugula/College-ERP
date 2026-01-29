<<<<<<< HEAD
FROM ubuntu:22.04
=======
FROM python:3.10-slim
>>>>>>> 70a7873 (Changes Made on Dockerfile update django to 5.XXX)

# ---- Environment ----
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive

# ---- Workdir ----
WORKDIR /app

<<<<<<< HEAD
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

COPY code .
=======
# ---- System deps ----
RUN apt-get update && apt-get install -y \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# ---- Python deps ----
COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# ---- App code ----
COPY code/ .
>>>>>>> 70a7873 (Changes Made on Dockerfile update django to 5.XXX)

# ---- Expose Django port ----
EXPOSE 8000

<<<<<<< HEAD
CMD ["/opt/venv/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]
=======
# ---- Run migrations + server ----
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]

>>>>>>> 70a7873 (Changes Made on Dockerfile update django to 5.XXX)
