FROM maven:3.6.3-jdk-11-slim
RUN apt update &&  apt install openssh-client sudo -y
RUN mkdir /root/.ssh/
RUN mkdir /home/prod
COPY /prod/Dockerfile /home/prod/
RUN chmod 777 /home/prod
COPY id_rsa /root/.ssh/
COPY id_rsa.pub /root/.ssh/
RUN useradd -u 109 jenkins
RUN chmod 600 /root/.ssh/id_rsa && chmod 600 /root/.ssh/id_rsa.pub
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get install -y docker-ce docker-ce-cli containerd.io


