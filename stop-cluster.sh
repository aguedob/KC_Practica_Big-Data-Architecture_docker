#!/bin/bash

echo "Stoping cluster..."
docker stop hadoop-master

# loading configuration
source $PWD/.config

# the default node number is 3
N=${1:-${NODES}}

i=1
while [ $i -lt $N ]
do
	docker stop hadoop-slave$i
	
	i=$(( $i + 1 ))
done 