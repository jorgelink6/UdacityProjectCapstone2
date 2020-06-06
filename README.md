# Capstone project for devops udacity nanodegree

## Project

The project consist in create a full CI/CD pipeline to manage a service, in my case I selected a Ngix docker server over wich I built a pipeline of validation and deployment. A green/blue dployment strategy will be used.

## Branch distribution
**master** : contains the cloudformation folder with the YAML file to create the Jenkins server. Also contains the Jenkinsfile to create the blue and green clusters

**blue** :  Docker and Jenkins file to deploy blue index.html

**green** : Docker and Jenkins file to deploy green index.html


### Initial Setup

#### Jenkins server

For the creation of the jenkins server I wrote a cloudformation script **JenkinsServer.yml** that will create a fresh EC2 insntance and install, start and authorize the necesary dependencies to run the pipeline correctly. Use this file with **JenkinsServer-params.json**. You will need to configure your awscli and install jenkins blue ocean and aws pipeline pluggins

I included two helper scripts to better use awscli with cloudformation : create.sh and update.sh

 e.g.
```
./create.sh JenkinsServer.yml JenkinsServer-params.json
``` 

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

The deplyoment pipeline part starts in the  **Deploy docker image to Docker Hub**  stage and concludes updating/creating a record in the s3 Hosted Zone created for the project that points to sites' URL. The hosted zone for the actual state of the project has to be manually created and then change the hardcoded --hosted-zone-id parameter.

Steps **9.** and **10.** were created as a solution to grab the Loadbalancer address and update with that value the target in the hosted zone record.

#### steps
5. Deploy docker image to Docker Hub
6. Set current kubectl context 
7. Create blue container
8. Expose container
9. Declaring variables
10. Generating new alias-config.json file from template
11. Domain s3 redirect blue


