#!/bin/bash

set -e

if [ -v $1 ]; 
then 
echo "you must provide the name of a repository to add"
exit 1
fi

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://apt.valk.sh/$1/pgp-key.public -o /etc/apt/keyrings/valkapt-$1.asc
sudo chmod a+r /etc/apt/keyrings/valkapt-$1.asc

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/valkapt-$1.asc] https://apt.valk.sh/$1 stable main" | sudo tee /etc/apt/sources.list.d/valkapt-$1.list > /dev/null
sudo apt-get update
