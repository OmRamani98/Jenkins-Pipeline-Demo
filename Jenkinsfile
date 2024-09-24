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
                        sh 'docker build -t om98245/dockerpipeline .'
                    } else {
                        bat 'docker build -t om98245/dockerpipeline .'
                    }
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Directly using username and password for Docker login
                    def username = 'om98245'
                    def password = 'om@982457' // Replace with your actual Docker Hub password

                    if (isUnix()) {
                        sh "echo ${password} | docker login -u ${username} --password-stdin"
                        sh 'docker push om98245/dockerpipeline'
                        sh 'docker logout'
                    } else {
                        bat "echo %password% | docker login -u %username% --password-stdin"
                        bat 'docker push om98245/dockerpipeline'
                        bat 'docker logout'
                    }
                }
            }
        }
    }
}
