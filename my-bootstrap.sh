#!/bin/bash
### 版本配置
### 当前使用fabric版本为1.4.4
FABRIC_VERSION=1.4.4
FABRIC_COUCHDB_VERSION=0.4.18

echo "########################################"
echo "#####     拉取fabric-ca START      #####"
echo "########################################"
echo ""
docker pull hyperledger/fabric-ca:$FABRIC_VERSION
docker tag hyperledger/fabric-ca:$FABRIC_VERSION hyperledger/fabric-ca:latest
echo ""
echo "########################################"
echo "#####     拉取fabric-ca  END       #####"
echo "########################################"
echo ""
echo ""

echo "########################################"
echo "#####   拉取fabric-orderer START   #####"
echo "########################################"
echo ""
docker pull hyperledger/fabric-orderer:$FABRIC_VERSION
docker tag hyperledger/fabric-orderer:$FABRIC_VERSION hyperledger/fabric-orderer:latest
echo ""
echo "########################################"
echo "#####   拉取fabric-orderer  END    #####"
echo "########################################"
echo ""
echo ""

echo "########################################"
echo "#####     拉取fabric-peer START    #####"
echo "########################################"
echo ""
docker pull hyperledger/fabric-peer:$FABRIC_VERSION
docker tag hyperledger/fabric-peer:$FABRIC_VERSION hyperledger/fabric-peer:latest
echo ""
echo "########################################"
echo "#####     拉取fabric-peer  END     #####"
echo "########################################"
echo ""
echo ""

echo "########################################"
echo "#####    拉取fabric-tools START    #####"
echo "########################################"
echo ""
docker pull hyperledger/fabric-tools:$FABRIC_VERSION
docker tag hyperledger/fabric-tools:$FABRIC_VERSION hyperledger/fabric-tools:latest
echo ""
echo "########################################"
echo "#####    拉取fabric-tools  END     #####"
echo "########################################"
echo ""

echo "########################################"
echo "#####   拉取fabric-couchdb START   #####"
echo "########################################"
echo ""
docker pull hyperledger/fabric-couchdb:$FABRIC_COUCHDB_VERSION
docker tag hyperledger/fabric-couchdb:$FABRIC_COUCHDB_VERSION hyperledger/fabric-couchdb:latest
echo ""
echo "########################################"
echo "#####   拉取fabric-couchdb  END    #####"
echo "########################################"
echo ""
echo ""

echo "########################################"
echo "#####  下载 fabric-samples START   #####"
echo "########################################"
echo ""
git clone -b master https://github.com/hyperledger/fabric-samples.git && cd fabric-samples && git checkout v${FABRIC_VERSION}
echo "########################################"
echo "#####  下载 fabric-samples START   #####"
echo "########################################"
echo ""
echo ""

echo "########################################"
echo "#####       全部执行完成 END       #####"
echo "########################################"

docker images
exit