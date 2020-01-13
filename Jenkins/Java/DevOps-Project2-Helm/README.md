
![Simple-DevOps-Project2-Java-Helm](https://user-images.githubusercontent.com/3519706/71467177-0beebf00-27d3-11ea-806e-b879f3e652d9.png)

#### []((https://github.com/OktaySavdi/Devops/edit/master/Jenkins/Java/DevOps-Project2-Helm)#Overview)Overview

On Jenkins, we will learn how to develop CI / CD processes in an automated manner with a pipeline mechanism.

We will create the pipeline for a Java application. The pipeline will first build the binary, 
create a docker image from it, push the image to Docker repo, then deploy it on the Kubernetes cluster using its helm chart.

Requirements

 - Git 
 - Jenkins 
 - Helm
 - Kubernetes/docker

Setup

 1. [Install-Jenkins.md](https://github.com/OktaySavdi/Devops/blob/master/Jenkins/Java/DevOps-Project1-Jenkins/Install-Jenkins.md)
 2. 
    [install-maven.md](https://github.com/OktaySavdi/Devops/blob/master/Jenkins/Java/DevOps-Project1-Jenkins/install-maven.md)

3. 
    [Install docker Registry](https://github.com/OktaySavdi/Devops/tree/master/Jenkins/Java/DevOps-Project1-Jenkins)

4. [jenkinsfile](jenkinsfile)

# Create helm Chart

    helm create liberty-app
    cd liberty-app/
Delete all yaml files under the template folder and move templates folder under the chart

#You can check that the chart works

    helm install liberty-app --dry-run --debug ./ --set image.repository=docker.registery.10.10.10.10.nip.io/websphere-liberty --set image.tag=1
 
 You can check image on registry

    curl -k https://docker.registery.10.10.10.10.nip.io/v2/_catalog
    curl -k https://docker.registery.10.10.10.10.nip.io/v2/websphere-liberty/tags/list
    
 ![Simple-DevOps-Project2-Java-Helm](https://user-images.githubusercontent.com/3519706/71468569-7f92cb00-27d7-11ea-8972-e4f37c86cbb0.png)


    http://myapplication-10.10.10.10.nip.io/webapp/

![Simple-DevOps-Project2-Java-Helm](https://user-images.githubusercontent.com/3519706/71554065-62eed100-2a2b-11ea-8a77-604671f788e4.png)
