#!/bin/bash

# SVN检出并Maven打包
#
# 参数：

# $1 部署路径
# $2 uuid
# $3 版本控制系统(1.SVN;2.GIT)
# $4 VCS地址
# $5 Git分支
# $6 Maven profile
# $7 module
# $8 context
# $9 Jetty的start.jar路径

echo $1,$2,$3,$4,$5,$6,$7,$8,$9

if [ -z "$1" ]||[ -z "$2" ]; then
    echo "参数不能为空"
    exit 0
fi
cd $1/$2

if [ $3 -eq 1 ]
then
	svn checkout $4
else
	git clone $4
	if [ "$5" != "null" ]; then
        git checkout $5
    fi
fi

cd $7

if [ "$6" != "null" ]; then
    mvn clean package -Dmaven.test.skip=true -P$6
else
    mvn clean package -Dmaven.test.skip=true
fi

cd ..

java -jar $9 --add-to-startd=http,deploy,jsp

mv $7/target/$7.war webapps/$8.war
