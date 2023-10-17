FROM maven:3.6.3-jdk-11-slim
RUN apt update &&  apt install openssh-client docker.io -y


