![https://github.com/OktaySavdi/Devops/tree/master/Gitlab/Java/Devops-Project6-Helm](https://user-images.githubusercontent.com/3519706/71672577-741b4300-2d87-11ea-9cbb-c2c12979bacd.png)

#### []((https://github.com/OktaySavdi/Devops/edit/master/Gitlab/Java/Devops-Project6-Helm)#Overview)Overview

On Gitlab, we will learn how to develop CI / CD processes in an automated manner with a pipeline mechanism.

We will create the pipeline for a Java application. The pipeline will first build the binary, 
create a docker image from it, push the image to Docker repo, then deploy it on the Kubernetes cluster using its helm chart.

Requirements

 - Git 
 - Gitlab
 - Gitlab-Runner
 - Helm
 - Kubernetes/docker

Setup

 1. [Install-Github-Runner.md](https://github.com/OktaySavdi/Devops/blob/master/Gitlab/Java/DevOps-Project5-Gitlab/Install-Github-Runner.md)
 2. 
    [Install-maven.md](https://github.com/OktaySavdi/Devops/blob/master/Gitlab/Java/DevOps-Project5-Gitlab/Install-maven.md)
3. [Install docker Registry](https://github.com/OktaySavdi/Devops/tree/master/Jenkins/Java/DevOps-Project1-Jenkins)
4. [gitlab-ci.yml](.gitlab-ci.yml)

# Create helm Chart

```
helm create liberty-app
cd liberty-app/

```

Delete all yaml files under the template folder and move templates folder under the chart

#You can check that the chart works

```
helm install liberty-app --dry-run --debug ./ --set image.repository=docker.registery.10.10.10.10.nip.io/websphere-liberty --set image.tag=1
```

![https://github.com/OktaySavdi/Devops/tree/master/Gitlab/Java/Devops-Project6-Helm](https://user-images.githubusercontent.com/3519706/71672472-1a1a7d80-2d87-11ea-8445-7ba25a68ad08.png)

    http://myapplication-10.10.10.10.nip.io/webapp/
    
 ![https://github.com/OktaySavdi/Devops/tree/master/Gitlab/Java/Devops-Project6-Helm](https://user-images.githubusercontent.com/3519706/71712081-c8203900-2e14-11ea-926c-02f963074e92.png)
