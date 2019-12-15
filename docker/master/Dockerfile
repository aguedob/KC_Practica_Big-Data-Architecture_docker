FROM agd/hadoop-cluster-base
LABEL maintainer="andres@meigal.com"

WORKDIR /root

RUN apt-get install -y vim python python3-pip python3-dev

# install Spark
RUN wget http://apache.rediris.es/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz && \
    tar -xvf spark-2.4.4-bin-hadoop2.7.tgz && \
    mv spark-2.4.4-bin-hadoop2.7 /usr/local/spark && \
    rm spark-2.4.4-bin-hadoop2.7.tgz


ENV PATH=$PATH:/usr/local/spark/bin
ENV SPARK_HOME=/usr/local/spark
ENV PYSPARK_PYTHON=/usr/bin/python3
ENV LD_LIBRARY_PATH=/usr/local/hadoop/lib/native:$LD_LIBRARY_PATH

COPY data/* /tmp/

ADD config/spark-defaults.conf /usr/local/spark/conf
RUN chown root:root /usr/local/spark/conf/spark-defaults.conf

ADD config/bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh && \
    chmod 700 /etc/bootstrap.sh && \
    mv /tmp/word-count-example.ipynb ~/word-count-example.ipynb && \
    pip3 install --no-cache-dir jupyter pandas numpy findspark pyspark

ENV BOOTSTRAP /etc/bootstrap.sh

VOLUME /data

CMD ["/etc/bootstrap.sh", "-d"]

EXPOSE 18080
EXPOSE 54000
