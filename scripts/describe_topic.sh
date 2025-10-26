#!/bin/bash

#truyen tham so dau vao (nếu không truyền thì mặc định là test-topic)
TOPIC_NAME=${1:-test-topic}

docker exec kafka-1 bash -c  "/opt/kafka/bin/kafka-topics.sh \
    --bootstrap-server kafka-1:9092 \
    --topic $TOPIC_NAME \
    --describe"