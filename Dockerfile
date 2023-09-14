FROM jupyter/pyspark-notebook:spark-3.3.2
USER root

# Add essential packages
RUN apt-get update && apt-get install -y build-essential curl git gnupg2 nano apt-transport-https software-properties-common
# Set locale
RUN apt-get update && apt-get install -y locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

USER $NB_USER
# Install Python requirements
COPY requirements.txt /home/jovyan/
RUN pip install -r /home/jovyan/requirements.txt