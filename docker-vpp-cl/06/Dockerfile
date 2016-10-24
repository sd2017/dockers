FROM sd2017/ubuntu:05

RUN apt-get update
RUN    apt-get install -y openjdk-8-jdk jedit git
RUN    apt-get install -y ktouch ibus libxkbfile-dev kdelibs5-dev  libkonq5-dev
RUN    apt-get install -y kdelibs-bin kdelibs5-data kdelibs5-plugins
#RUN    apt-get install -y plasma-workspace
RUN    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
RUN ibus-daemon -d  #for running ktouch
ENV CL_JDK=/usr/lib/jvm/java-1.8.0-openjdk-amd64/


#RUN userdel developer
RUN useradd -m developer && \
        echo "developer:developer" | chpasswd && \
        usermod --shell /bin/sh developer && \
        usermod -aG sudo developer && \
        #echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$developer && \
        #chmod 0440 /etc/sudoers.d/developer && \
        # Replace 1000 with your user/group id
        usermod  --uid 1001 developer && \
        groupmod --gid 1001 developer
