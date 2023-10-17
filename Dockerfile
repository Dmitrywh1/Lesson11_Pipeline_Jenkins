FROM maven:3.6.3-jdk-11-slim
RUN apt update &&  apt install openssh-client docker.io -y
COPY id_rsa /root/.ssh/ && id_rsa.pub /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa && chmod 600 /root/.ssh/id_rsa.pub

