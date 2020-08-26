# collectd setup

```
# apt install influxdb-client
influx -port 28086
CREATE DATABASE collectd
use collectd
alter retention policy "autogen" on "collectd" duration 200m shard duration 1h
CREATE RETENTION POLICY "day" ON collectd DURATION 1d REPLICATION 1
CREATE RETENTION POLICY "week" ON collectd DURATION 7d REPLICATION 1
CREATE RETENTION POLICY "month" ON collectd DURATION 31d REPLICATION 1
CREATE RETENTION POLICY "year" ON collectd DURATION 366d REPLICATION 1
CREATE CONTINUOUS QUERY "cq_day" ON "collectd" BEGIN SELECT mean(value) as value INTO "collectd"."day".:MEASUREMENT FROM /.*/ GROUP BY time(60s),* END
CREATE CONTINUOUS QUERY "cq_week" ON "collectd" BEGIN SELECT mean(value) as value INTO "collectd"."week".:MEASUREMENT FROM /.*/ GROUP BY time(300s),* END
CREATE CONTINUOUS QUERY "cq_month" ON "collectd" BEGIN SELECT mean(value) as value INTO "collectd"."month".:MEASUREMENT FROM /.*/ GROUP BY time(1800s),*
CREATE CONTINUOUS QUERY "cq_year" ON "collectd" BEGIN SELECT mean(value) as value INTO "collectd"."year".:MEASUREMENT FROM /.*/ GROUP BY time(21600s),* END
show retention policies

```

