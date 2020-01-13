
<img width="750" alt="ans" src="https://user-images.githubusercontent.com/3519706/71545177-0ba02080-2999-11ea-8711-81cc18ff05b0.png">

#### []((https://github.com/OktaySavdi/Devops/edit/master/Jenkins/Java/DevOps-Project4-Ansible)#Overview)Overview

On Jenkins, we will learn how to develop CI / CD processes in an automated manner with a pipeline mechanism.

We will create the pipeline for a Java application. The pipeline will first build the binary, 
create a docker image from it, push the image to Docker repo, then deploy it on the Kubernetes cluster using its Ansible.

Requirements

 - Git 
 - Jenkins 
 - Ansible
 - Kubernetes/docker

Setup

 1. [Install-Jenkins.md](https://github.com/OktaySavdi/Devops/blob/master/Jenkins/Java/DevOps-Project1-Jenkins/Install-Jenkins.md)
 2. 
    [install-maven.md](https://github.com/OktaySavdi/Devops/blob/master/Jenkins/Java/DevOps-Project1-Jenkins/install-maven.md)

3. 
    [Install docker Registry](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins)

4. [jenkinsfile](https://github.com/OktaySavdi/Devops/tree/master/Jenkins/Java/DevOps-Project1-Jenkins)
5. [playbook](playbook)

# Install Docker module for Ansible on Docker Server

    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py
    pip install docker

#You can check that the chart works

    ansible-playbook /opt/devops/playbook.yaml -i /opt/devops/inventory.txt --extra-vars '{"version":"105"}'
    
    ansible-playbook /opt/devops/playbook.yaml -i /opt/devops/inventory.txt --extra-vars "version=$BUILD_NUMBER"

You can check image on registry

    curl -k https://docker.registery.10.10.10.10.nip.io/v2/_catalog
    curl -k https://docker.registery.10.10.10.10.nip.io/v2/websphere-liberty/tags/list

 ![https://github.com/OktaySavdi/Simple-DevOps-Project4-Java-Ansible](https://user-images.githubusercontent.com/3519706/71554009-60d84280-2a2a-11ea-89f6-f0aff272e58d.png)



    http://myapplication-10.10.10.10.nip.io/webapp/
    
![https://github.com/OktaySavdi/Simple-DevOps-Project4-Java-Ansible](https://user-images.githubusercontent.com/3519706/71554366-2e7d1400-2a2f-11ea-9a82-5e1a3abbde8e.png)
