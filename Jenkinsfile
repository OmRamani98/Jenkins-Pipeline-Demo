pipeline {
    agent any

    stages {
        stage("Checkout") {
            steps {
                checkout scmGit(branches: [[name: '*/main']], 
                                extensions: [], 
                                userRemoteConfigs: [[credentialsId: 'github', 
                                                     url: 'https://github.com/OmRamani98/Jenkins-Pipeline-Demo']])
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
                withCredentials([usernamePassword(credentialsId: 'dockerhub', 
                                                  passwordVariable: 'DOCKERHUB_PASSWORD', 
                                                  usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    script {
                        if (isUnix()) {
                            sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                            sh 'docker push omramani/dockerpipeline'
                            sh 'docker logout'
                        } else {
                            bat 'docker login -u %DOCKERHUB_USERNAME% -p %DOCKERHUB_PASSWORD%'
                            bat 'docker push omramani/dockerpipeline'
                            bat 'docker logout'
                        }
                    }
                }
            }
        }
    }
}
