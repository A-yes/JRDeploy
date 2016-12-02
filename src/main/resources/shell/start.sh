#!/usr/bin/env bash

# $1 项目部署路径
# $2 uuid
# $3 jetty start.jar
# $4 端口号

cd $1/$2
nohup java -jar $3 jetty.http.port=$4 projectuuid=$2 > $1/$2/log.out 2>&1 &
echo "running"
