#!/bin/bash
echo "======= start ======="
echo "======= 清理所有docke进程 ======="
docker kill $(docker ps -aq)
echo "======= 清理所有docker实例 ======="
docker rm $(docker ps -aq)
echo "======= 清理所有docker无用空间 ======="
docker volume prune -f
echo "======= 清理所有network无用网络 ======="
docker network prune -f
echo "======= 清理配置文件 ======="
rm -rf crypto-config
rm -rf channel-artifacts/*
echo "=======  end  ======="
exit