#!/usr/bin/env bash
# $1 部署路径
# $2 uuid
if [ -z "$1" ]||[ -z "$2" ]; then
    echo "参数不能为空"
    exit 0 
fi
mkdir -p $1/$2/shell
cd $1/$2/shell
wget -c http://publiclass.oss-cn-shanghai.aliyuncs.com/jrdeploy/package.sh
cd ~
rm -- "$0"
