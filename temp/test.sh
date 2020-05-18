
docker exec -e CORE_PEER_LOCALMSPID=Org1MSP -e CORE_PEER_ADDRESS=peer0.org1.baolijinglight.com:7051 -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.baolijinglight.com/users/Admin@org1.baolijinglight.com/msp -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.baolijinglight.com/peers/peer0.org1.baolijinglight.com/tls/ca.crt cli peer chaincode install -n chaincode002 -v 2.3 -p github.com/chaincode/chaincode002 -l golang
docker exec -e CORE_PEER_LOCALMSPID=Org2MSP -e CORE_PEER_ADDRESS=peer0.org2.baolijinglight.com:9051 -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.baolijinglight.com/users/Admin@org2.baolijinglight.com/msp -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.baolijinglight.com/peers/peer0.org2.baolijinglight.com/tls/ca.crt cli peer chaincode install -n chaincode002 -v 2.3 -p github.com/chaincode/chaincode002 -l golang
docker exec -e CORE_PEER_LOCALMSPID=Org1MSP -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.baolijinglight.com/users/Admin@org1.baolijinglight.com/msp cli peer chaincode instantiate -o orderer.baolijinglight.com:7050 -C mychannel -n chaincode002 -l golang -v 2.3 -c '{"Args":[""]}' -P 'OR('\''Org1MSP.member'\'','\''Org2MSP.member'\'')' --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/baolijinglight.com/orderers/orderer.baolijinglight.com/msp/tlscacerts/tlsca.baolijinglight.com-cert.pem --peerAddresses peer0.org1.baolijinglight.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.baolijinglight.com/peers/peer0.org1.baolijinglight.com/tls/ca.crt

#
# 升级
#
peer chaincode upgrade -o orderer.baolijinglight.com:7050 -C mychannel -n chaincode002 -l golang -v 2.3 -c '{"Args":[""]}' -P 'OR('\''Org1MSP.member'\'','\''Org2MSP.member'\'','\''Org3MSP.member'\'')' --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/baolijinglight.com/orderers/orderer.baolijinglight.com/msp/tlscacerts/tlsca.baolijinglight.com-cert.pem --peerAddresses peer0.org1.baolijinglight.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.baolijinglight.com/peers/peer0.org1.baolijinglight.com/tls/ca.crt

#
# 调用
#
peer chaincode invoke -o orderer.baolijinglight.com:7050 -C mychannel -n chaincode002 -c '{"function":"save","Args":["001", "222", "333"]}' --waitForEvent --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/baolijinglight.com/orderers/orderer.baolijinglight.com/msp/tlscacerts/tlsca.baolijinglight.com-cert.pem

