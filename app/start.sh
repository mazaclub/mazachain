#!/bin/bash
source /mazachain.env
# allow variables to be set from systemd/env files/docker env 
# For --link use 
##test -z $MAZACOIND && MAZACOIND=$(cat /mazachain/env |grep ${PROJECT^^}_DAEMON | grep ${RPCPORT}| grep TCP_ADDR | awk -F\= '{print $2}')
MAZACOIND=${MAZACOIND:-localhost}
MAZADIR=${MAZADIR:-/home/coin/.mazacoin}
NETWORK=${NETWORK:-livenet}
RPCPORT=${RPCPORT:-12832}
RPCUSER=$(grep rpcuser ${MAZADIR}/mazacoin.conf |awk -F\= '{print $2}')
RPCPASSWORD=$(grep rpcpassword ${MAZADIR}/mazacoin.conf |awk -F\= '{print $2}')

echo "$(date) starting mazawatch with RPC from: ${MAZACOIND}:${RPCPORT}"
echo "BITCOIND_HOST= ${MAZACOIND} BITCOIN_DATADIR=${MAZADIR} BITCOIND_USER= ${RPCUSER} INSIGHT_NETWORK= ${NETWORK}"
BITCOIND_HOST=${MAZACOIND} BITCOIN_DATADIR="${MAZADIR}" BITCOIND_USER=${RPCUSER} BITCOIND_PASS=${RPCPASSWORD}  INSIGHT_NETWORK=${NETWORK} npm start
