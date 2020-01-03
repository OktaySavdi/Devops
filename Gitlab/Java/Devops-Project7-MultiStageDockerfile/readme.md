![https://github.com/OktaySavdi/Devops/tree/master/Gitlab/Java/Devops-Project7-MultiStageDockerfile](https://user-images.githubusercontent.com/3519706/71672825-20f5c000-2d88-11ea-8436-008f50b701b9.png)

Produced with the 2nd most primitive method of CI / CD processes

Requirements

 - Git 
 - Gitlab
 - Gitlab-Runner
 - Kubernetes/docker

Setup

 1. [Install-Github-Runner.md](https://github.com/OktaySavdi/Devops/blob/master/Gitlab/Java/DevOps-Project5-Gitlab/Install-Github-Runner.md)
2. 
    [Install docker Registry](https://github.com/OktaySavdi/Devops/tree/master/Jenkins/Java/DevOps-Project1-Jenkins)

3. [gitlab-ci.yml](.gitlab-ci.yml)

# MultiStage Dockerfile

```
    FROM maven:3.6.3-jdk-8 as jdk
    WORKDIR /build
    COPY . . 
    RUN mvn package
    
    FROM websphere-liberty:latest
    COPY --from=jdk /build/webapp/target/webapp.war /config/dropins/
    COPY --from=jdk /build/server.xml /config/
    ENV LICENSE accept
```

![https://github.com/OktaySavdi/Devops/tree/master/Gitlab/Java/Devops-Project7-MultiStageDockerfile](https://user-images.githubusercontent.com/3519706/71672940-5b5f5d00-2d88-11ea-8670-879ce9a4d2a4.png)

```
http://myapplication-10.10.10.10.nip.io/webapp/
```