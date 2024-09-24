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
                withCredentials([usernamePassword(credentialsId: 'dockerhub', 
                                                  passwordVariable: 'DOCKERHUB_PASSWORD', 
                                                  usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    script {
                        if (isUnix()) {
                            sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                            sh 'docker push omramani/dockerpipeline'
                            sh 'docker logout'
                        } else {
                            bat 'echo %DOCKERHUB_PASSWORD% | docker login -u %DOCKERHUB_USERNAME% --password-stdin'
                            bat 'docker push omramani/dockerpipeline'
                            bat 'docker logout'
                        }
                    }
                }
            }
        }
    }
}
