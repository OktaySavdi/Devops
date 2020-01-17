

![https://github.com/OktaySavdi/Devops/tree/master/Buildah/Java](https://user-images.githubusercontent.com/3519706/72339357-25e73780-36d7-11ea-873d-b39d66f64705.png)

#### [](https://github.com/OktaySavdi/Devops/tree/master/Buildah/Java#Overview)Overview

On Gitlab, we will learn how to develop CI / CD processes in an automated manner with a pipeline mechanism.

We will create the pipeline for a Java application. The pipeline will first build the binary, 
create a docker image on Buildah, push the image to docker repo, then deploy it on the Kubernetes.

#### [](https://github.com/OktaySavdi/Devops/tree/master/Buildah/Java#Why_buildah?)Why buildah?
Lots of people would like to build OCI/container images within a system like Kubernetes. Imagine you have a CI/CD system that is constantly building container images, a tool like Kubernetes would be useful for distributing the load of builds. Until recently, most people were leaking the Docker socket into the container and then allowing the containers to do docker build. As I pointed out years ago, this is one of the most dangerous things you can do.  

Because of this, many people have been attempting to run Buildah within a container.  We have built an example of what we think is the best way to run Buildah inside of a container. 

Requirements

 - Git 
 - Gitlab / Gitlab-Runner
 - Maven
 - Java
 - Buildah
 - Kubernetes/docker

Setup

 1. [Install-Gitlab.md](https://github.com/OktaySavdi/Devops/blob/master/Gitlab/Java/DevOps-Project5-Gitlab/Install-Github-Runner.md)

 2. [Install-Maven.md](https://github.com/OktaySavdi/Devops/blob/master/Gitlab/Java/DevOps-Project5-Gitlab/Install-maven.md)
 3. [Install-Java.md](https://github.com/OktaySavdi/Devops/blob/master/Jenkins/Java/DevOps-Project1-Jenkins/Install-Jenkins.md)
 4. [Install-Buildah.md](Buildah.md)
 5. 
    [Install docker Registry](https://github.com/OktaySavdi/Devops/tree/master/Jenkins/Java/DevOps-Project1-Jenkins)

#### [](https://github.com/OktaySavdi/Devops/tree/master/Buildah/Java#permission)Give permisson for Gitlab

#Gitlab Server

vi /home/**gitlab-runner**/.bashrc

    JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b03-1.el7.x86_64
    export JAVA_HOME
    PATH=$PATH:$JAVA_HOME

#for  gitlab-runner user

    sudo -su gitlab-runner bash
    ssh-keygen -b 4096 -t rsa -f /home/gitlab-runner/.ssh/id_rsa -N ""
    ssh-copy-id -i /home/gitlab-runner/.ssh/id_rsa.pub root@10.10.10.10 

#for root user

    ssh-keygen -b 4096 -t rsa -f ~/.ssh/id_rsa -N "" 
    ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.10.10.10

#### [](https://github.com/OktaySavdi/Devops/tree/master/Buildah/Java#docker-registery)add registry certificates to the gitlab server

    cp /opt/cert/registry.cert /etc/pki/ca-trust/source/anchors/

#command is run after moving certificates

    update-ca-trust extract

6.[gitlab-ci.yml](.gitlab-ci.yml)


You can check image on registry

    curl -k https://docker.registery.10.10.10.10.nip.io/v2/_catalog
    curl -k https://docker.registery.10.10.10.10.nip.io/v2/websphere-liberty/tags/list
  ![https://github.com/OktaySavdi/Devops/tree/master/Buildah/Java](https://user-images.githubusercontent.com/3519706/72341915-87f66b80-36dc-11ea-8f09-db2d385e355f.png)


    http://myapplication-10.10.10.10.nip.io/webapp/

![https://github.com/OktaySavdi/Devops/tree/master/Buildah/Java](https://user-images.githubusercontent.com/3519706/72342105-e6bbe500-36dc-11ea-8d52-8acb0a572616.png)
