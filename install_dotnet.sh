#!/usr/bin/env bash
CURR_PATH=$( pwd )
cd ~
wget https://dotnet.microsoft.com/download/dotnet-core/thank-you/sdk-3.1.201-linux-arm64-binaries
wget https://download.visualstudio.microsoft.com/download/pr/ec985ae1-e15c-4858-b586-de5f78956573/f585f8ffc303bbca6a711ecd61417a40/aspnetcore-runtime-3.1.2-linux-arm64.tar.gz

mkdir dotnet-arm64
tar zxf dotnet-sdk-3.1.102-linux-arm64.tar.gz -C $HOME/dotnet-arm64
tar zxf aspnetcore-runtime-3.1.2-linux-arm64.tar.gz -C $HOME/dotnet-arm64
 
cd $CURR_PATH
