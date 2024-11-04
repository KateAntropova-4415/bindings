# Sigmoid for a Vector: Write a function that applies the sigmoid function to each element of a vector.
## Прогресс:
### Step-1: Функция на C++
Выбрана функция применения функции сигмоиды к вектору.
### Step-2: Pybind, cmake
Написаны **bindings.cpp** и **Makefile**
### Step-3: Подготовка пакета
Написаны **pyproject.toml** и **setup.py**
### Step-4: Установка пакета
Написан **Dockerfile**, в котором командой **python3 -m build** получаем **.whl** файл, затем устанавливаем его через **pip install**
<br/>  
Создаём Docker контейнер и запускаем, устанавливаем **setup.py** и делаем **make all**<br/>

```bash
docker build -t sigmoid_base .
docker run -it --name my_container sigmoid_base /bin/bash
```
  
### Step-5: Проверка работоспособности
Запущен тестик **test_sigmoid.cpp** из него внутри созданного контейнера с помощью **make run_tests**:<br/>
<p align="center"><img src=https://github.com/KateAntropova-4415/bindings/blob/main/screenshots/photo2.PNG /></p>

Запущен скрипт с тестами **perf.py**, который сравнивает результаты биндинга с результатами питоновских библиотек **Math** и **Numpy**:<br/>
<p align="center"><img src=https://github.com/KateAntropova-4415/bindings/blob/main/screenshots/photo1.PNG /></p>
<br/> 

## Радуемся, что всё работает, и надеемся на хорошую оценку!
