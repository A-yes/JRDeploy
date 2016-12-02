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

if [ -z "$1" ]||[ -z "$2" ]; then
    echo "参数不能为空"
    exit 0
fi
echo "*****cd $1/$2*****"
cd $1/$2

echo "*****get code*****"
if [ -e $7 ]
then
    cd $7
    if [ $3 -eq 1 ]
    then
        svn update
    else
        git pull
    fi
    cd ..
else
    if [ $3 -eq 1 ]
    then
	    svn checkout $4
    else
	    git clone $4
	    if [ "$5" != "null" ]; then
            git checkout $5
        fi
    fi
fi

echo "*****cd $7*****"
cd $7

echo "*****packaging*****"
if [ "$6" != "null" ]; then
    mvn clean package -Dmaven.test.skip=true -P$6
else
    mvn clean package -Dmaven.test.skip=true
fi

echo "***** cd .. *****"
cd ..

echo "***** jetty *****"
java -jar $9 --add-to-startd=http,deploy,jsp

echo "***** mv war *****"
mv $7/target/$7.war webapps/$8.war
