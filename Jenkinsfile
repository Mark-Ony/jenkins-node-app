pipeline {
    agent any

    tools {
        nodejs "NodeJS_18" // Must match the NodeJS tool name in Jenkins config
    }

    stages {
        stage('Checkout') {
            steps {
                 git branch: 'main', url: 'https://github.com/Mark-Ony/jenkins-node-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'chmod +x ./node_modules/.bin/jest'
                sh './node_modules/.bin/jest'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = "onyangzzz2/jenkins-node-app"
                    sh "docker build -t ${imageName}:latest ."
                }
            }
        }
    }

    post {
        success {
            echo '🎉 Build and tests passed!'
        }
        failure {
            echo '❌ Build failed. Check logs!'
        }
    }
}
