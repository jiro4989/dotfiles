FROM ubuntu:19.04

RUN apt update -y
RUN apt install -y git
RUN git clone https://github.com/jiro4989/setup 
WORKDIR setup
RUN ./setup.sh ubuntu

ENTRYPOINT [ "bash" ]
