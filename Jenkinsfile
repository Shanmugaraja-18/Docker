pipeline {
    agent any
    
    stages {
        stage('Clone repository') {
            steps {
                checkout scm
            }
        }
        
        stage('Build image') {
            steps {
                script {
                    def dockerImage = docker.build("chellatamilan/pywebapp:${env.BUILD_NUMBER}")
                    dockerImage.inside {
                        sh 'python -m unittest' // Run tests if available
                    }
                }
            }
        }
        
        stage('Push image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
