#! /bin/bash

# check if ES is running
if [ -f /tmp/elasticsearch.pid ];
then
  PID=`cat /tmp/elasticsearch.pid`
  if kill -TERM $PID;
  then
    echo "ElasticSearch has just been stopped"
    rm /tmp/elasticsearch.pid
  fi
else
    echo "File elasticsearch.pid not found in es bin directory"
    echo "Unable to stop."
fi


