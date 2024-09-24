pipeline {
    agent any

    stages {
        stage("Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/OmRamani98/Jenkins-Pipeline-Demo'
            }
        }

        stage("Build Image") {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker build -t omramani/dockerpipeline .'
                    } else {
                        bat 'docker build -t omramani/dockerpipeline .'
                    }
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Replace 'YOUR_DOCKERHUB_USERNAME' and 'YOUR_DOCKERHUB_PASSWORD' with your actual credentials
                    def username = 'om98245'
                    def password = 'om@982457'

                    if (isUnix()) {
                        sh "echo ${password} | docker login -u ${username} --password-stdin"
                        sh 'docker push omramani/dockerpipeline'
                        sh 'docker logout'
                    } else {
                        bat "echo %password% | docker login -u %username% --password-stdin"
                        bat 'docker push omramani/dockerpipeline'
                        bat 'docker logout'
                    }
                }
            }
        }
    }
}
