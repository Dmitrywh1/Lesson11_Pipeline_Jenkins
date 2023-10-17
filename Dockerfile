FROM maven:3.6.3-jdk-11-slim
RUN apt update &&  apt install openssh-client docker.io -y
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa


