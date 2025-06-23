pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'rmann8@gmu.edu'
        IMAGE_NAME = 'rmann14/hw2-image'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/rmann-14/SWE-645-HW2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKERHUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-pass') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Update Kubernetes Deployment') {
            steps {
                script {
                    sh """
                    kubectl apply -f hw2-deployment.yaml
                    kubectl apply -f hw2-service.yaml
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
