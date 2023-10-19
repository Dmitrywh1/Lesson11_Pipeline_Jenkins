FROM maven:3.6.3-jdk-11-slim
USER root
RUN apt update &&  apt install openssh-client openssh-server sudo -y
RUN mkdir /root/.ssh/
RUN mkdir /home/prod
COPY /prod/Dockerfile /home/prod/
RUN chmod 777 /home/prod
COPY keyl11 /home/prod
COPY keyl11.pub /home/prod
COPY known_hosts /root/.ssh/
RUN chmod 600 /home/prod/keyl11
RUN chmod 600 /root/.ssh/known_hosts
RUN groupadd -g 109 jenkins && \
    useradd -u 109 -g jenkins -m -s /bin/bash jenkins
RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get install docker.io -y


