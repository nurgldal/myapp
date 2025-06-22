pipeline {
    agent any

    tools {
        maven 'Maven_3.9.10'  // Global Tool Configuration’da verdiğin Maven ismiyle aynı olmalı
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub') // Jenkins Credentials ID
        IMAGE_NAME = 'myapp'
        IMAGE_TAG = 'v1'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Bulding Maven project...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker image') {
            steps {
                echo ' Building Docker image...'
                sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
            }
        }

        stage('DockerHub login') {
            steps {
                echo ' Logging into DockerHub...'
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
            }
        }

        stage('Push the image') {
            steps {
                echo ' Tagging and pushing image to DockerHub...'
                sh "docker tag $IMAGE_NAME:$IMAGE_TAG $DOCKERHUB_CREDENTIALS_USR/$IMAGE_NAME:$IMAGE_TAG"
                sh "docker push $DOCKERHUB_CREDENTIALS_USR/$IMAGE_NAME:$IMAGE_TAG"
            }
        }
    }
}
