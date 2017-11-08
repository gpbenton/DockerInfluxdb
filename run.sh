docker run -d --name=influxdb -p 8086:8086 -p 8088:8088 -v /home/graham/influxdb:/etc/influxdb:ro -v influxdbdata:/var/lib/influxdb gpbenton/dockerinfluxdb
