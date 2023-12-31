FROM ${AIRFLOW_IMAGE_NAME:-apache/airflow:2.2.4}

USER root
RUN apt-get update && \
    apt-get clean

USER airflow
RUN pip install --upgrade pip 
RUN pip install "setuptools<58"
RUN pip3 install \
    psycopg2==2.7.5 \
    newspaper3k
   
COPY requirements.txt /opt/airflow
WORKDIR /opt/airflow
RUN pip install -r requirements.txt 

