# DockerInfluxdb
Creates a docker container from Influxdb binary tar files

I was repurposing a 386 based PC, and wanted to run Influxdb to store history for my home automation sensors.

InfluxData don't supply packages for 386, and building from source was challenging.  So I learned some Docker by converting the 386 binary files InfluxData do supply into a docker image.

# Usage

Exposes ports 8086 for web interface and 8088 for backup.  Run with 

   docker run -d --name=influxdb -p 8086:8086 -p 8088:8088 -v /home/graham/influxdb:/etc/influxdb:ro -v influxdbdata:/var/lib/influxdb gpbenton/i386-influxdb

Other docker commands are available for use with docker exec at /usr/bin.  In particular you can use influx interactively with

   docker exec -it influxdb influx


# Status
Working on my machine.  Your mileage may vary.
