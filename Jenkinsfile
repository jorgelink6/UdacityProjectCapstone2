pipeline{
    agent any
    stages {

        stage('create blue cluster kubernetes') {
            steps {
                withAWS(region:'eu-west-2', credentials:'aws-static') {
                    sh '''
                        eksctl create cluster \
                        --name BlueClusterCapstone \
                        --version 1.16 \
                        --region eu-west-2 \
                        --nodegroup-name standard-workers \
                        --node-type t3.medium \
                        --nodes 1 \
                        --nodes-min 1 \
                        --nodes-max 4 \
                        --managed
                    '''
                }
            }
        }

        stage('create green cluster kubernetes') {
            steps {
                withAWS(region:'eu-west-2', credentials:'aws-static') {
                    sh '''
                        eksctl create cluster \
                        --name GreenClusterCapstone \
                        --version 1.16 \
                        --region eu-west-2 \
                        --nodegroup-name standard-workers \
                        --node-type t3.medium \
                        --nodes 1 \
                        --nodes-min 1 \
                        --nodes-max 4 \
                        --managed
                    '''
                }
            }
        }

        stage('create blue config') {
            steps {
                withAWS(region:'eu-west-2', credentials:'aws-static') {
                    sh 'aws eks --region eu-west-2 update-kubeconfig --name GreenClusterCapstone'
                }
            }
        }

        stage('create green config') {
            steps {
                withAWS(region:'eu-west-2', credentials:'aws-static') {
                    sh 'aws eks --region eu-west-2 update-kubeconfig --name BlueClusterCapstone'
                }
            }
        }






    }
}