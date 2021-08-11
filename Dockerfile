FROM python:3.8.10

RUN wget https://downloads.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz && \
    tar -xvf spark-3.1.2-bin-hadoop3.2.tgz && \
    rm -rf spark-3.1.2-bin-hadoop3.2.tgz && \
    mv spark-3.1.2-bin-hadoop3.2 spark \
    wget https://repo1.maven.org/maven2/org/apache/spark/spark-avro_2.12/3.1.2/spark-avro_2.12-3.1.2.jar \
    mv spark-avro_2.12-3.1.2.jar spark/jars

RUN pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir pyspark

RUN apt-get update && apt-get install -y \
  default-jre \
  && rm -rf /var/lib/apt/lists/*

ENV SPARK_HOME="/spark"
ENV PATH="/spark/bin:${PATH}"

