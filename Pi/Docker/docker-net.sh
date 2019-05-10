#!/bin/bash
# Docker-net macvlan setup
# Docker Subnet: 10.10.10.80/28
# Range: (14) 10.10.10.81 - 10.10.10.94
# Broadcast: 10.10.10.95
# subnetID: 10.10.10.80

docker network create -d macvlan \
  --subnet=10.10.10.0/24 \
  --gateway=10.10.10.1 \
  --ip-range=10.10.10.80/28 \
  --aux-address='host=10.10.10.95' \
  -o parent=eth0 \
  docker-net
