# Capstone project for devops udacity nanodegree

## project

The project consist in create a full CI/CD pipeline to manage a service, in my case I selected a Ngix docker server over wich I built a pipeline of validation and deployment. A green/blue dployment strategy will be used.

## Branch distribution
**master** : contains the cloudformation folder with the YAML file to create the Jenkins server. Also contains the Jenkinsfile to create the blue and green clusters

**blue** :  Docker and Jenkins file to deploy blue index.html
 
**green** : Docker and Jenkins file to deploy green index.html


### Initial Setup

#### Jenkins server

for the creation of the jenkins server I wrote a cloudformation script that will create a EC2 insntance and install the necesary dependencies to run the pipeline

##### Dependencies
1.
2.

### Continous integration

For validation only were used linting tools and the docker build succes,