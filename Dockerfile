FROM maven:3.6.3-jdk-11-slim
RUN apt update &&  apt install openssh-client docker.io -y
RUN mkdir /root/.ssh/
COPY id_rsa /root/.ssh/
COPY id_rsa.pub /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa && chmod 600 /root/.ssh/id_rsa.pub
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
