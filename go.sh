#!/usr/bin/env bash
CURR_PATH=$( pwd )
cd ~
curl -O https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.14.2.linux-amd64.tar.gz

# cat >> ~/.profile << EOF
# export GOPATH=$HOME/work
# export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
# export GOROOT=$HOME/go
# export GOPATH=$HOME/work
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# EOF

source ~/.profile
cd $CURR_PATH
