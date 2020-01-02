![https://github.com/OktaySavdi/Devops/tree/master/Gitlab/Java/Devops-Project6-Helm](https://user-images.githubusercontent.com/3519706/71672577-741b4300-2d87-11ea-9cbb-c2c12979bacd.png)

Made with the most primitive method of CI / CD processes

Requirements

 - Git 
 - Gitlab
 - Gitlab-Runner
 - Helm
 - Kubernetes/docker

Setup

 1. [[Install-Github-Runner.md](https://github.com/OktaySavdi/Devops/blob/master/Gitlab/Java/DevOps-Project5-Gitlab/Install-Github-Runner.md)]
 2. 
    [[Install-maven.md](https://github.com/OktaySavdi/Devops/blob/master/Gitlab/Java/DevOps-Project5-Gitlab/Install-maven.md)]
3. [[Install docker Registry](https://github.com/OktaySavdi/Devops/tree/master/Gitlab/Java/DevOps-Project5-Gitlab)]
4. [[gitlab-ci.yml](.gitlab-ci.yml)]

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
