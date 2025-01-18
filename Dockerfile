# Koristi službenu Ubuntu sliku kao osnovu
FROM ubuntu:20.04

# Postavljanje okruženja za nesmetano korištenje 'apt-get'
ENV DEBIAN_FRONTEND=noninteractive

# Instalacija JDK-a, curl-a i drugih potrebnih alata
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    curl \
    vim \
    bash \
    python3 \
    python3-pip \
    && apt-get clean

# Postavljanje JAVA_HOME za Spark
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Verzija Sparka
ENV SPARK_VERSION=3.4.1

# Provjera i preuzimanje Apache Spark-a
RUN curl -O https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3.tgz && \
    tar -xvzf spark-$SPARK_VERSION-bin-hadoop3.tgz && \
    mv spark-$SPARK_VERSION-bin-hadoop3 /opt/spark && \
    rm spark-$SPARK_VERSION-bin-hadoop3.tgz

# Postavljanje SPARK_HOME i PATH
ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$PATH

# Instalacija PySparka, pandas, Jupyter i drugih Python paketa
RUN pip3 install pyspark pandas jupyter

# Postavljanje radnog direktorija u kontejneru
WORKDIR /app

# Expose za Jupyter Notebook port
EXPOSE 8888

# Pokretanje Jupyter Notebooka
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
