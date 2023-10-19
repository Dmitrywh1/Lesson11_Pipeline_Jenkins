pipeline {
    agent {
        docker {
                image 'morgotq/test19'
                args '-v /var/run/docker.sock:/var/run/docker.sock --privileged'
        }
    }
    stages {
        stage('Clone repository') {
            steps {
                git branch: 'master', url: 'https://github.com/Dmitrywh1/Lesson11.git'
            }
        }
        stage('Compile code') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Build image for prod') {
            steps {
                sh 'cp webapp/target/webapp.war /home/prod && cd /home/prod && docker build -t prod11 .'
                sh '''docker tag prod11 morgotq/prod11 && docker login -u morgotq -p test && docker push morgotq/prod11'''
            }
        }
        stage('Run docker in Prod') {
            steps {
                sh 'ssh-keyscan 51.250.98.231 >> ~/.ssh/known_hosts'
                sh '''ssh -i /home/jenkins/.ssh/keyl11 root@51.250.98.231 <<  EOF
        sudo docker pull morgotq/prod11
        sudo docker run -d -p 8060:8080 morgotq/prod11
EOF'''
            }
        }
    }
}