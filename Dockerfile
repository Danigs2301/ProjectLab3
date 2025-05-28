FROM python:3.10-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de requisitos y los instala
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copia todo el código y la base de datos
COPY . .

# Expón el puerto por defecto de Django o Gunicorn
EXPOSE 8000

# Comando para ejecutar Gunicorn (ajusta 'Fanalca.wsgi:application' si es necesario)
CMD ["gunicorn", "Fanalca.wsgi:application", "--bind", "0.0.0.0:8000"]

