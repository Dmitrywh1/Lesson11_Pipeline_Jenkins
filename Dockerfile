FROM maven:3.6.3-jdk-11-slim
RUN apt install openssh-client -yK
RUN apt update &&  apt install docker.io -y


