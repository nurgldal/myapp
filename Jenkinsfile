pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub') // Jenkins Credentials ID
        IMAGE_NAME = "myapp"
        IMAGE_TAG = "v1"
    }

    stages {
        stage('Build') {
            steps {
                // Repo clone zaten SCM kısmında yapılmış olacak, tekrar gerek yok
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker image') {
            steps {
                sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
            }
        }

        stage('DockerHub login') {
            steps {
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
            }
        }

        stage('Push the image') {
            steps {
                sh "docker tag $IMAGE_NAME:$IMAGE_TAG $DOCKERHUB_CREDENTIALS_USR/$IMAGE_NAME:$IMAGE_TAG"
                sh "docker push $DOCKERHUB_CREDENTIALS_USR/$IMAGE_NAME:$IMAGE_TAG"
            }
        }
    }
}


