#!/bin/bash
set -e  # Dừng script nếu có lỗi

echo "🐳 Starting Kafka cluster (3 brokers)..."
docker compose up -d

echo "⏳ Waiting for containers to start..."
sleep 10

echo "✅ Containers running:"
docker ps --filter "name=kafka"

echo ""
echo "🔍 Checking cluster health..."
for node in 1 2 3
do
  echo "➡️  Broker kafka-$node status:"
  docker exec kafka-$node bash -c "ps aux | grep kafka | grep -v grep" >/dev/null && \
    echo "   ✅ kafka-$node is running" || echo "   ❌ kafka-$node is not running"
done

echo ""
echo "🧩 Listing brokers in cluster:"
docker exec kafka-1 bash -c "/opt/kafka/bin/kafka-metadata-quorum.sh describe --bootstrap-server kafka-1:9092"

echo ""
echo "📦 Creating test topic (test-topic)..."
docker exec kafka-1 bash -c "/opt/kafka/bin/kafka-topics.sh \
  --create --topic test-topic \
  --bootstrap-server kafka-1:9092 \
  --partitions 3 --replication-factor 3 || true"

echo ""
echo "✅ Cluster is up and ready!"
docker exec kafka-1 bash -c "/opt/kafka/bin/kafka-topics.sh --bootstrap-server kafka-1:9092 --list"
