FROM maven:3.6.3-jdk-11-slim
RUN apt update &&  apt install openssh-client docker.io -y
RUN mkdir /root/.ssh/
RUN mkdir /home/prod
COPY /prod/Dockerfile /home/prod/
RUN chmod 777 /home/prod
COPY id_rsa /root/.ssh/
COPY id_rsa.pub /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa && chmod 600 /root/.ssh/id_rsa.pub
