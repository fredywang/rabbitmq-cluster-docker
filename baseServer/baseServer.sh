#!/bin/bash
#time=$(date +%Y%m%d)_$(date +%H%M%S)
time=$(date +%Y%m%d)
docker build --tag=rabbitmq:3.7.7 $(dirname "$0") --no-cache | tee -a logs/docker_build_$time.log 
echo **********************************************END*************************************************** | tee -a logs/docker_build_$time.log
