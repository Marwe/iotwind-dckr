#!/bin/bash


echo "dumping complete influxDB content to CSV"
outf="/tmp/influxdataexport.$(date -I).csv.gz"

echo "exporting to $outf"

docker exec -it influxdbiotwind influx -database iotwind -format csv -execute 'SELECT * from iotwind' | gzip > "$outf"

echo "DONE"

sleep 10

