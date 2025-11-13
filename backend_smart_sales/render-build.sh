#!/usr/bin/env bash
# exit on error
set -o errexit

# 1. Instalar dependencias del sistema para weasyprint
echo "Instalando dependencias del sistema para WeasyPrint..."
apt-get update && apt-get install -y \
    libcairo2-dev \
    libpango1.0-dev \
    libgdk-pixbuf2.0-dev

# 2. Instalar dependencias de Python
echo "Instalando dependencias de Python..."
pip install -r requirements.txt

# 3. Recolectar archivos estáticos
echo "Recolectando archivos estáticos..."
python manage.py collectstatic --noinput

# 4. Correr migraciones de la base de datos
echo "Aplicando migraciones..."
python manage.py migrate