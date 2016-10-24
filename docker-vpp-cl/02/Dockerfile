FROM sd2017/ubuntu:01


# Install make and compilers
RUN apt-get update && \
    apt-get install -y build-essential autoconf automake cmake lxterminal&& \
    apt-get install -y  lxterminal&& \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*


ENTRYPOINT ["/bin/bash"]
