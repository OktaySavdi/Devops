
![https://github.com/OktaySavdi/Simple-DevOps-Project3-Java-MultistageDockerfile](https://user-images.githubusercontent.com/3519706/71479930-a9fc7c80-2807-11ea-84d0-c46866f62b03.png)

#### []((https://github.com/OktaySavdi/Devops/edit/master/Jenkins/Java/DevOps-Project3-MultistageDockerfile)#Overview)Overview

On Jenkins, we will learn how to develop CI / CD processes in an automated manner with a pipeline mechanism.

We will create the pipeline for a Java application. The pipeline will first build the binary, 
create a docker image with MultistageDockerfile, push the image to docker repo, then deploy it on the Kubernetes.

Requirements

 - Git 
 - Jenkins 
 - Kubernetes/docker

Setup

 1. [Install-Jenkins.md](Install-Jenkins.md)

 2. 
    [Install docker Registry](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins)

 3. [jenkinsfile](jenkinsfile)

# MultiStage Dockerfile 

        FROM maven:3.6.3-jdk-8 as jdk
        WORKDIR /build
        COPY . . 
        RUN mvn package
        
        FROM websphere-liberty:latest
        COPY --from=jdk /build/webapp/target/webapp.war /config/dropins/
        COPY --from=jdk /build/server.xml /config/
        ENV LICENSE accept



 
 ![(https://github.com/OktaySavdi/Simple-DevOps-Project3-Java-MultistageDockerfile)](https://user-images.githubusercontent.com/3519706/71479834-38243300-2807-11ea-8cfa-7079bd1014e8.png)


    http://myapplication-10.10.10.10.nip.io/webapp/

![https://github.com/OktaySavdi/Simple-DevOps-Project3-Java-MultistageDockerfile](https://user-images.githubusercontent.com/3519706/71554107-ec060800-2a2b-11ea-9041-ffb5ae5c4917.png)
