#!/bin/bash

TOPIC_NAME=${1:-test-topic}

echo "🚀 Listening to topic '$TOPIC_NAME' ... (Ctrl + C to stop)"

docker exec -it kafka-1 bash -c "/opt/kafka/bin/kafka-console-consumer.sh \
  --bootstrap-server kafka-1:9092 \
  --topic $TOPIC_NAME"
