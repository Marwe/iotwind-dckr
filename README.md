## IoT Windmessung Setup 

## Docker services

### Influxdb

* reachable from outside of docker via http://localhost:28086
* reachable from inside of docker via http://influxdb:8086

### Chronograf

* reachable from outside of docker via http://localhost:28888/ 

    SHOW MEASUREMENTS ON "iotwind"
    iotwind

* http://localhost:28888/


### Grafana config

Es gibt einen iotwind admin für Grafana
* access via http://localhost:28080
* InfluxDB data source URL in grafana: http://influxdb:8086

###
