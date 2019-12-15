#!/bin/bash

service ssh start

# start cluster
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh 

# create paths and give permissions
$HADOOP_HOME/bin/hdfs dfs -mkdir /spark-logs
$HADOOP_HOME/bin/hdfs dfs -mkdir /user
$HADOOP_HOME/bin/hdfs dfs -mkdir /user/root
$HADOOP_HOME/bin/hdfs dfs -put /tmp/words.txt /user/root


# start spark history server
$SPARK_HOME/sbin/start-history-server.sh

jupyter notebook --ip=0.0.0.0  --port 54000 --allow-root

bash
