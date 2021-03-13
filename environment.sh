#!/bin/bash
#目前包含make,screen,docker,g++,gcc,git,nodejs,yarn,go
sudo apt-get update -y && sudo apt-get upgrade -y;
sudo apt-get install make -y;
sudo apt-get install screen -y;
sudo apt-get remove docker docker-engine docker.io;
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && sudo apt-get update &&  sudo apt-get install docker-ce -y ;
sudo apt-get install g++ -y;
sudo apt-get install gcc -y;
sudo apt-get install git -y;
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && sudo apt-get install -y nodejs ;
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && sudo apt update && sudo apt install yarn
sudo rm -rf /usr/local/go;
curl https://dl.google.com/go/go1.15.7.linux-amd64.tar.gz | sudo tar -C/usr/local -zxvf - ;
cat <<'EOF' >>$HOME/.profile
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
EOF
clear;
echo "检查版本信息及是否安装成功"
echo -e "make版本信息" && make -v;
echo -e "\n\nscreen版本信息" && screen -v;
echo -e "\n\ndocker版本信息" && docker -v;
echo -e "\n\ng++版本信息" && g++ -v;
echo -e "\n\ngcc版本信息" && gcc -v;
echo -e "\n\ngit版本信息" && git --version;
echo -e "\n\nnodejs版本信息" && node -v;
echo -e "\n\nyarn版本信息" && yarn -v;
echo -e "\n\n请运行source $HOME/.profile 来激活go，并运行go version检查版本和安装情况"





