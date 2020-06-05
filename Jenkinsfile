pipeline {
    agent any
    stages {

        stage('start') {  
            steps {
                sh 'echo "Hello World"'
                sh '''
                    echo "Multiline shell steps works too"
                    ls -lah
                '''
            }
        }
        stage('Lint HTML') {
            steps {
                sh 'tidy -q -e *.html'
            }
        }
        stage('Lint Dockerfile') {
            steps {
                sh 'hadolint Dockerfile'
            }
        }
        stage('Build docker') {
            steps {
                sh 'docker build --tag=apiml .'
            }
        }
        stage('Deploy docker to Docker Hub') {
            steps {
                sh 'docker login --username jorgelink6 --password testpassword'
                sh 'dockerpath=jorgelink6/apiml'
                sh 'docker tag apiml:latest jorgelink6/apiml:ngix'
                sh 'docker push jorgelink6/apiml:ngix'
                sh 'docker logout'
            }
        } 
        stage('Set current kubectl context') {
            steps {
                withAWS(region:'eu-west-2', credentials:'aws-static') {
                    sh 'kubectl config use-context arn:aws:eks:eu-west-2:141256150370:cluster/BlueClusterCapstone'
                }
            }
        }
        stage('Create blue container') {
            steps {
                withAWS(region:'eu-west-2', credentials:'aws-static') {
                    sh 'kubectl create deployment blueimage2 --image=jorgelink6/apiml:ngix --port=80'
                }
            }
        }
        stage('Expose container') {
            steps {
                withAWS(region:'eu-west-2', credentials:'aws-static') {
                    sh 'kubectl expose deployment blueimage2 --type=LoadBalancer --port=80'
                }
            }
        }







    }
} 