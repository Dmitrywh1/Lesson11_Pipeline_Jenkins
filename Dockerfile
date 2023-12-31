FROM maven:3.6.3-jdk-11-slim
# Install packages
RUN apt update &&  apt install openssh-client openssh-server sudo -y
# Create catalog and copy Dockerfile for further build
RUN mkdir /home/prod
COPY /prod/Dockerfile /home/prod/
# Configure ssh client and give permissions for jenkins user
COPY keyl11 /home/jenkins/.ssh/
COPY keyl11.pub /home/jenkins/.ssh/
RUN chmod 600 /home/jenkins/.ssh/keyl11 && \
    chmod 600 /home/jenkins/.ssh/keyl11.pub
RUN groupadd -g 109 jenkins && \
    useradd -u 109 -g jenkins -m -s /bin/bash jenkins
RUN chown -R jenkins:jenkins /home/jenkins && \
    chown - R jenkins:jenkins /home/prod \
# Install docker
RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get install docker.io -y


