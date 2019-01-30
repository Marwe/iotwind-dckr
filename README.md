## IoT Wind Setup 

## Docker services

Docker compose file for 
* an MQTT server (mosquitto)
* InfluxDB and additionally 
    * chronograf (administration GUI for InfluxDB, visualisation)
    * grafana (visualisation of measurement values, graphs)

The service ports internally are default ones, from outside of docker add 20000.

No special users/access control were configured, as these services are meant to be run locally. 
Look at the docker images documentation for more information about each.

### Influxdb

* reachable from outside of docker via http://localhost:28086
* reachable from inside of docker via http://influxdb:8086

### Chronograf

* reachable from outside of docker via http://localhost:28888/ 

    SHOW MEASUREMENTS ON "iotwind"
    iotwind

* http://localhost:28888/

### Grafana config

Create admin password for grafana on first connect (default admin:admin)
* access via http://localhost:28080
* InfluxDB data source URL in grafana: http://influxdb:8086

### Mosquitto

* reach on port localhost:21883


