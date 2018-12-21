FROM ubuntu:xenial
MAINTAINER Radu Ciorba radu@devrandom.ro

RUN apt-get purge -y python.* && \
    echo "deb http://ppa.launchpad.net/deadsnakes/ppa/ubuntu xenial main" >> /etc/apt/sources.list && \
    echo "deb-src http://ppa.launchpad.net/deadsnakes/ppa/ubuntu xenial main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F23C5A6CF475977595C89F51BA6932366A755776 && \
    apt-get update && \
    apt-get install -y python2.7 python3.4 python3.5 python3.6 python3.7 && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.6 /get-pip.py && \
    pip install --upgrade pip && \
    ln -s /usr/bin/python3.6 /usr/bin/python && \
    rm -f /get-pip.py && \
    rm -rf /var/lib/apt/lists/*
