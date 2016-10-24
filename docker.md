#docker
##docker install

>sudo apt-get update

>sudo apt-get install apt-transport-https ca-certificates

>sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

>echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list

>sudo apt-get update

>apt-cache policy docker-engine

>sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

>sudo apt-get install docker-engine

>sudo service docker start

>sudo groupadd docker

>sudo usermod -aG docker $USER

|docker| commands|
| --- | --- |
|`docker ctrl p q`|    exit container without close it|
|`docker exec`  |  running another command in the docker|
|`docker ps -a` ! grep imagename ! awk '{print $1}' ! xargs docker rm   |rm image containers|
|`docker build -t` sd2017ubuntu:1604.01 -m "user"` | Creating new image from docker file in same directory|
|`docker commit -m` "msg"  3bfe6772524e sd2017/ubuntu:04 | Creating image from container|  
|`docker exec `--user root -it clionx /bin/sh |Exec additional command in a running docker |
|`docker history` image  |image rollback  https://gist.github.com/dasgoll/476ecc7a057ac885f0be |
|`docker pull` maven:3.3.9-jdk-7| docker pull image:tag from repository docker hub|
|`docker run -itd` --name=maven  maven:3.3.9-jdk-7  /bin/bash | starting pseudo terminal named container, with image and bash command |
|`docker run -itd --link` server3 --name=client3 client_img /bin/bash |run with ****link****|
| `docker ps` / `docker ps -a`| docker list running/stopped containers |
| `docker run -d -name1 wev1 -p` 8081:80|  ****exposing host:guest port****|
|`docker-compose up` | building and running composed docker containers with services|

|`docker images`| list docker images||||
|---|---|---|---|
|REPOSITORY|TAG|IMAGE ID  | CREATED  | SIZE|
|ubuntu|16.04|45bc58500fa3    |    43 hours ago |       126.9 MB|


https://docs.docker.com/engine/tutorials/dockerimages/  building images
https://docs.docker.com/engine/reference/builder/  Dockerfile builder



#GIT

|git|commands|
|---|---|
|git tag   | get list of tags|
|git init   |creating git repository in ./|
|git config --global user.email "sd2017@walla.co.il"||
|git config --global user.name "sd2017"||
|git config --global push.default simple||
|git push --set-upstream origin master|`TBD`|
|git add  --all  |   http://stackoverflow.com/questions/17743549/git-recursively-add-the-entire-folder |
|git commit -am "initial from http://www.qtrac.eu/pipbook-1.0.tar.gz"|`TBD -a`|
|git tag  0.1  -m "initial from http://www.qtrac.eu/pipbook-1.0.tar.gz"|tag number and messege|   
|git push|moving upstream from local to remote repository|
|---|---|



#linux commandline

|linux|commands|
|---|---|
|echo '123:456'!  cut -d: -f1 |     -string coloumns|
| http://unix.stackexchange.com/questions/81349/how-do-i-use-find-when-the-filename-contains-spaces ||
| http://www.linuxjournal.com/article/7385   | brackets braces substitution|
|wget  -nH --cut-dirs=1  -np http://higheredbcs.wiley.com/legacy/college/goodrich/1118290275/dsap/ch0{1,2,3,4,5,6,7,8,9}.zip  |wget removing top site dirs,    get 9 files , 9 inputs to command|
 |exec "$0" "$@"' |  run the script instead of command|
  |  http://superuser.com/questions/878967/what-do-these-parameters-do  |
  |http://askubuntu.com/questions/368509/why-is-0-set-to-bash                                         |
  |   unzip 	  ch0{1,2,3,4,5,6,7,8,9}.zip   | not working because they stuff all the files onto the same command line. While that works with most programs, unzip will take the first argument as the zip file, and any after the first as files to extract from it. You need to execute the command once for each file:|
|nproc|number of processprs|
|lscpu|info on cpu|
  |find . -name "*.zip" -print0 ! xargs -0 -n1 unzip|`TBD`|
|find . -name '*.zip' -exec unzip {} \;|`TBD`|
|useradd user||
|userdel user||


#pythonic

##list comprehention

```python
 new_list = ["something with " + ITEM for ITEM in iterable if condition_based_on(ITEM)]
```

```python
new_list = []
 for ITEM in iterable:
    if condition_based_on(ITEM):
        new_list.append("something with " + ITEM)
```
