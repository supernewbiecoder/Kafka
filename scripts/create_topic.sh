#!/bin/bash

TOPIC_NAME=${1:-test-topic}

echo "🚀 Creating topic '$TOPIC_NAME' on broker kafka-1:9092 ..."

docker exec kafka-1 bash -c "/opt/kafka/bin/kafka-topics.sh \
  --create \
  --topic '$TOPIC_NAME' \
  --bootstrap-server kafka-1:9092 \
  --replication-factor 3 \
  --partitions 3"

echo "✅ Done. Listing topics:"
docker exec kafka-1 bash -c "/opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka-1:9092 --list"
