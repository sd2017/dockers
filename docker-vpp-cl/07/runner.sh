docker run --name=clionx -it \
    --rm \
    --user=developer \
    --env="DISPLAY" \
    --workdir="/home/developer" \
    --volume="/home/developer:/home/developer" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    sd2017/ubuntu:06

xhost +local:`docker inspect --format='{{ .Config.Hostname }}' clionx`

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
