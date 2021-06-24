#!/usr/bin/env bash

echo "List of folders inside ${LOGS_HOME}:";
ls -alt ${LOGS_HOME};

echo "List of all containers including stopped:";
curl -s --unix-socket /var/run/docker.sock http://v1.41/containers/json?all=1 | jq '.[] | {name: .Names[0], id: .Id}';

/usr/bin/inotifywait --monitor --event CLOSE_WRITE --format %f --recursive ${LOGS_HOME} | while IFS= read -r file; do
	processing_started=0;
	
	if [ "${file: -4}" == ".log"  ]; then
		echo "Found a log file:";
		echo ${file};
	fi
done

echo 'Error in watcher.sh';
exit 1;
