#!/bin/bash
time=$(date +%Y%m%d)
BASEDIR=$(dirname "$0")
cd $BASEDIR/cluster/
docker-compose up -d
