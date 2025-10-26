#!/bin/bash
echo "Listing topics on every node..."

for node in 1 2 3
do
  echo "Node: kafka-$node"
  docker exec kafka-$node bash -c "/opt/kafka/bin/kafka-topics.sh --bootstrap-server kafka-$node:9092 --list"
  echo ""
done
