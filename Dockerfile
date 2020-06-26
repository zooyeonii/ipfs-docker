FROM ubuntu:16.04
MAINTAINER zooyeonii <zooyeonii4680@gmail.com>

RUN apt-get update 
RUN apt-get upgrade -y 
RUN ["apt-get", "install", "-y", "vim"]

RUN echo "Install Golang"
RUN wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
RUN tar -zxvf go1.14.2.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf /tmp/go1.14.2.linux-amd64.tar.gz
RUN rm /tmp/go1.14.2.linux-amd64.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

RUN echo "Install IPFS"
RUN wget --no-check-certifiacte -P /tmp https://dist.ipfs.io/go-ipfs/v0.4.21/go-ipfs_v0.4.21_linux-amd64.tar.gz
RUN tar -C /tmp -xzf /tmp/go-ipfs_v0.4.21_linux-amd64.tar.gz
RUN cd /tmp/go-ipfs && ./install.sh &&
RUN rm -rf /tmp/go-ipfs &&
RUN rm /tmp/go-ipfs_v0.4.21_linux-amd64.tar.gz 
