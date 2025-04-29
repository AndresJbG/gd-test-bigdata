# Imagen base de Java
FROM openjdk:11-slim

# Evitar prompts interactivos
ENV DEBIAN_FRONTEND=noninteractive

# Instalamos Python, pip, y utilidades necesarias
RUN apt-get update --fix-missing && \
    apt-get install -y procps python3 python3-pip wget tar git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalamos PySpark, Jupyter, Delta Sharing
RUN pip3 install pyspark jupyter delta-sharing

# Descargamos e instalamos Apache Spark 3.5.5 con Hadoop 3
RUN wget https://downloads.apache.org/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3.tgz && \
    tar xvf spark-3.5.5-bin-hadoop3.tgz && \
    mv spark-3.5.5-bin-hadoop3 /opt/spark && \
    rm spark-3.5.5-bin-hadoop3.tgz

# Variables de entorno para Spark
ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$PATH

# Exponemos el puerto para Jupyter Notebook
EXPOSE 8888

# Comando por defecto: inicia Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root"]
