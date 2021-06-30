FROM python:3.6

RUN wget https://downloads.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz && \
    tar -xvf spark-3.1.2-bin-hadoop3.2.tgz && \
    rm -rf spark-3.1.2-bin-hadoop3.2.tgz && \
    mv spark-3.1.2-bin-hadoop3.2 spark

RUN pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir pyspark

RUN apt-get update && apt-get install -y \
  default-jre \
  && rm -rf /var/lib/apt/lists/*

ENV SPARK_HOME="/spark"
ENV PATH="/spark/bin:${PATH}"

