#!/bin/bash

systemctl stop babylond
rm -f babylon-testnet_latest.tar.lz4
scp 10.88.135.3:/home/ubuntu/babylon-testnet_latest.tar.lz4 ./
mkdir bak
cp -r .babylond/config /home/ubuntu/bak
rm -rf .babylond
babylond init recover-temp --chain-id bbn-test-3
tar -Ilz4 -xf babylon-testnet_latest.tar.lz4 -C $HOME/.babylond
cp /home/ubuntu/bak/config/config.toml /home/ubuntu/.babylond/config/
