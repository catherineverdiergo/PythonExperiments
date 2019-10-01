#! /bin/bash

sudo sysctl -w vm.max_map_count=262144

# check if ES is running
if [ -f /tmp/elasticsearch.pid ];
then
  PID=`cat /tmp/elasticsearch.pid`
  if kill -0 $PID;
  then
    echo "ElasticSearch is already running"
  else
    # start it and keep its pid
    $HOME/TOOLS/BigData/es-661/bin/elasticsearch &
    echo $! > /tmp/elasticsearch.pid
  fi
else
  # start it and keep its pid
  $HOME/TOOLS/BigData/es-661/bin/elasticsearch > /tmp/elasticsearch.log 2>&1 &
  echo $! > /tmp/elasticsearch.pid
fi


