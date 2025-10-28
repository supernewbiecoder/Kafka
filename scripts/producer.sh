#!/bin/bash
TOPIC_NAME=${1:-test-topic}
echo "Thread producer(simulation) is running..., CTR + C to stop"

docker exec -it kafka-1 bash -c "/opt/kafka/bin/kafka-console-producer.sh \
  --bootstrap-server kafka-1:9092 \
  --topic $TOPIC_NAME"