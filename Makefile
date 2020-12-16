KAFKA=/opt/kafka_2.13-2.6.0
HOST=localhost
PORT=9092

start-zookeeper:
	@${KAFKA}/bin/zookeeper-server-start.sh ${KAFKA}/config/zookeeper.properties

start-kafka:
	@${KAFKA}/bin/kafka-server-start.sh ${KAFKA}/config/server.properties

show-consumer:
	@${KAFKA}/bin/kafka-consumer-groups.sh --all-groups --bootstrap-server ${HOST}:${PORT} --describe

describe-topics:
	@${KAFKA}/bin/kafka-topics.sh --describe --bootstrap-server ${HOST}:${PORT}

list-topics:
	@${KAFKA}/bin/kafka-topics.sh --list --bootstrap-server ${HOST}:${PORT}