sudo apt-get remove docker docker-engine docker.io;
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && sudo apt-get update &&  sudo apt-get install docker-ce -y ;
mkdir ~/.streamrDocker;
mkdir ~/.streamrDocker2;
mkdir ~/.streamrDocker3
