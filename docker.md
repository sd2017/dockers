#docker
##docker install

$ sudo apt-get update
$ sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install docker-engine
sudo service docker start
 sudo groupadd docker
 sudo usermod -aG docker $USER

|docker| commands|
| --- | --- |
|`docker ctrl p q`|    exit container without close it|
|`docker exec`  |  running another command in the docker|
|`docker ps -a` ! grep imagename ! awk '{print $1}' ! xargs docker rm   |rm image containers|
|`docker build -t` sd2017ubuntu:1604.01 -m "user"` | Creating new image from docker file in same directory|
|`docker commit -m` "msg"  3bfe6772524e sd2017/ubuntu:04 | Creating image from container|  
|`docker exec `--user root -it clionx /bin/sh |Exec additional command in a running docker |
https://docs.docker.com/engine/tutorials/dockerimages/  building images
https://docs.docker.com/engine/reference/builder/  Dockerfile builder
