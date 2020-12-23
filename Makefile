KAFKA=/opt/kafka_2.13-2.6.0
HOST=localhost
PORT=9092

start-zookeeper:
	@${KAFKA}/bin/zookeeper-server-start.sh ${KAFKA}/config/zookeeper.properties

start-kafka-server-1:
	@${KAFKA}/bin/kafka-server-start.sh ${KAFKA}/config/server1.properties

start-kafka-server-2:
	@${KAFKA}/bin/kafka-server-start.sh ${KAFKA}/config/server2.properties

start-kafka-server-3:
	@${KAFKA}/bin/kafka-server-start.sh ${KAFKA}/config/server3.properties

start-kafka-server-4:
	@${KAFKA}/bin/kafka-server-start.sh ${KAFKA}/config/server4.properties

show-consumer:
	@${KAFKA}/bin/kafka-consumer-groups.sh --all-groups --bootstrap-server ${HOST}:${PORT} --describe

describe-topics:
	@${KAFKA}/bin/kafka-topics.sh --describe --bootstrap-server ${HOST}:${PORT}

describe-topics-zookeeper:
	@${KAFKA}/bin/kafka-topics.sh --describe --zookeeper ${HOST}:2181

list-topics:
	@${KAFKA}/bin/kafka-topics.sh --list --bootstrap-server ${HOST}:${PORT}