
![https://github.com/OktaySavdi/Simple-DevOps-Project5-Java-Gitlab](https://user-images.githubusercontent.com/3519706/71611615-5c876300-2bab-11ea-8fa7-5569b9acf778.png)

Made with the most primitive method of CI / CD processes

Requirements

 - Git 
 - Gitlab
 - Kubernetes/docker

Setup

 1. [Install-Github-Runner.md](Install-Github-Runner.md)
 2. 
    [Install-maven.md](Install-maven.md)
 3. 
    [Install docker Registry](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins)

    
#### [](https://github.com/OktaySavdi/Simple-DevOps-Project5-Java-Gitlab#permission)Give permisson for Gitlab

#Gitlab Server

vi /home/**gitlab-runner**/.bashrc

    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b03-1.el7.x86_64
    export JAVA_HOME
    PATH=$PATH:$JAVA_HOME

#Gitlab Runner Server

    sudo -su gitlab-runner bash
    ssh-keygen -b 4096 -t rsa -f ~/.ssh/id_rsa -N "" 
    ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.10.10.10 

#for root user

    ssh-keygen -b 4096 -t rsa -f ~/.ssh/id_rsa -N "" 
    ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.10.10.10

4.[gitlab-ci.yml](.gitlab-ci.yml)

![https://github.com/OktaySavdi/Simple-DevOps-Project5-Java-Gitlab](https://user-images.githubusercontent.com/3519706/71611416-a53e1c80-2ba9-11ea-98d2-305131d5758a.png)

    http://myapplication-10.10.10.10.nip.io/webapp/

![https://github.com/OktaySavdi/Simple-DevOps-Project5-Java-Gitlab](https://user-images.githubusercontent.com/3519706/71611470-390fe880-2baa-11ea-8878-916986af66b1.png)
