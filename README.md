# Capstone project for devops udacity nanodegree

## Project

The project consist in create a full CI/CD pipeline to manage a service, in my case I selected a Ngix docker server over wich I built a pipeline of validation and deployment. A green/blue dployment strategy will be used.

## Branch distribution
**master** : contains the cloudformation folder with the YAML file to create the Jenkins server. Also contains the Jenkinsfile to create the blue and green clusters

**blue** :  Docker and Jenkins file to deploy blue index.html

**green** : Docker and Jenkins file to deploy green index.html


### Initial Setup

#### Jenkins server

For the creation of the jenkins server I wrote a cloudformation script **JenkinsServer.yml** that will create a fresh EC2 insntance and install, start and authorize the necesary dependencies to run the pipeline correctly. you will need to config your awscli and install jenkins blue ocean and aws pipeline pluggins

##### Dependencies
- default-jdk
- jenkins
- docker.io
- hadolint
- kubectl
- tidy
- unzip
- aws
- eksctl

## Pipeline
### Continous integration

For validation only were used linting tools and the docker build succes

#### steps
1. start
2. Lint HTML
3. Lint Dockerfile
4. Build Docker file

### Continuos deployment

The deplyoment pipeline part starts in the  **Deploy docker to Docker Hub**  stage and concludes updating/creating a record in the s3 Hosted Zone created for the project.

5.


