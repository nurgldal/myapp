pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        IMAGE_TAG = "v1"
    }

    stages {
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

        stage('Run Container (Optional)') {
            steps {
                sh 'docker rm -f myapp-container || true'
                sh 'docker run -d -p 8080:8080 --name myapp-container $IMAGE_NAME:$IMAGE_TAG'
            }
        }
    }
}

