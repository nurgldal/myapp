pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        IMAGE_TAG = "v1"
        DOCKERHUB = credentials('dockerhub') // Jenkins'e eklediğin DockerHub kimlik ID
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/nurgldal/myapp.git'
            }
        }

        stage('Build Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('DockerHub Login') {
            steps {
                sh 'echo $DOCKERHUB_PSW | docker login -u $DOCKERHUB_USR --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker tag $IMAGE_NAME:$IMAGE_TAG $DOCKERHUB_USR/$IMAGE_NAME:$IMAGE_TAG'
                sh 'docker push $DOCKERHUB_USR/$IMAGE_NAME:$IMAGE_TAG'
            }
        }
    }
}

