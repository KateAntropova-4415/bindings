FROM python:3.11

RUN pip install --upgrade pip setuptools wheel build pybind11
RUN pip install numpy

RUN apt-get update && apt-get install -y \
    libgtest-dev \
    build-essential \
    cmake \
    python3-dev \
    libopenblas-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Копируем код проекта в контейнер
WORKDIR /app
COPY . .

# Собираем пакет в .whl файл
RUN python3 -m build

# Устанавливаем собранный .whl файл
RUN pip install dist/*.whl

# Запускаем контейнер (можно указать команду запуска приложения, если требуется)
#CMD ["python3", "setup.py"]
