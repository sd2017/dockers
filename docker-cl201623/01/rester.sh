docker start  -i clion23x

xhost +local:`docker inspect --format='{{ .Config.Hostname }}' clion23x`

#    XSOCK=/tmp/.X11-unix
#    XAUTH=/tmp/.docker.xauth
#    touch $XAUTH
#    xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

#    docker run -it \
#            --workdir="/home/developer" \
#            --volume="/home/developer:/home/developer" \
#            --volume=$XSOCK:$XSOCK:rw \
#            --volume=$XAUTH:$XAUTH:rw \
#            --env="XAUTHORITY=${XAUTH}" \
#            --env="DISPLAY" \
#            --user="developer" \
#        sd2017/ubuntu:06
