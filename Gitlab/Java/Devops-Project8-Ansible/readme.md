![https://github.com/OktaySavdi/Devops/tree/master/Gitlab/Java/DevOps-Project8-Ansible](https://user-images.githubusercontent.com/3519706/71669085-93f93980-2d7c-11ea-969f-5164b684f2d1.png)


Produced with the 4nd most primitive method of CI / CD processes

Requirements

 - Git 
 - Gitlab
 - Gitlab-Runner
 - Ansible
 - Kubernetes/docker

Setup

 1. [Install-Github-Runner.md](https://github.com/OktaySavdi/Devops/blob/master/Gitlab/Java/DevOps-Project5-Gitlab/Install-Github-Runner.md)
 2. 
    [install-maven.md](https://github.com/OktaySavdi/Devops/blob/master/Gitlab/Java/DevOps-Project5-Gitlab/Install-maven.md)

3. 
    [Install docker Registry](https://github.com/OktaySavdi/Devops/tree/master/Jenkins/Java/DevOps-Project1-Jenkins)

4. [gitlab-ci.yml](.gitlab-ci.yml)
5. [playbook](playbook)

# Install Docker module for Ansible on Docker Server

    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py
    pip install docker

#You can check that the chart works

    ansible-playbook /opt/devops/playbook.yaml -i /opt/devops/inventory.txt --extra-vars '{"version":"105"}'
    
    ansible-playbook /opt/devops/playbook.yaml -i /opt/devops/inventory.txt --extra-vars "version=$BUILD_NUMBER"

 ![https://github.com/OktaySavdi/Devops/tree/master/Gitlab/Java/DevOps-Project8-Ansible](https://user-images.githubusercontent.com/3519706/71669010-55fc1580-2d7c-11ea-9bcc-0d64e318c003.png)


    http://myapplication-10.10.10.10.nip.io/webapp/
    
![https://github.com/OktaySavdi/Devops/tree/master/Gitlab/Java/DevOps-Project8-Ansible](https://user-images.githubusercontent.com/3519706/71669023-6613f500-2d7c-11ea-91bf-0d4d7bf453d4.png)
