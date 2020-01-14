![https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins](https://user-images.githubusercontent.com/3519706/71445545-b9a69300-272b-11ea-9869-b229947b1308.png)

#### []((https://github.com/OktaySavdi/Devops/blob/master/Jenkins/Java/DevOps-Project1-Jenkins)#Overview)Overview

On Jenkins, we will learn how to develop CI / CD processes in an automated manner with a pipeline mechanism.

This guide shows you how to set up a CI/CD pipeline between Jenkins and a Kubernetes cluster with Jenkins's Auto DevOps feature. With this configuration, 
every change to application code is automatically built as a Docker container and deployed to the Kubernetes cluster for review and test.

Requirements

 - Git 
 - Jenkins 
 - Kubernetes/docker

Setup

 1. [Install-Jenkins.md](Install-Jenkins.md)
 2. 
    [install-maven.md](install-maven.md)
    
# Install docker Registry 
#### [](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins#Create-certificate-for-https)Create certificate for https

    openssl req -newkey rsa:2048 -nodes -keyout /opt/cert/registry.key -x509 -days 365 -out /opt/cert/registry.cert

    Country Name (2 letter code) [XX]:TR
    State or Province Name (full name) []:IST
    Locality Name (eg, city) [Default  City]:IST
    Organization Name (eg, company) [Default  Company  Ltd]:HB
    Organizational  Unit Name (eg, section) []:HB
    Common Name (eg, your name or your server's hostname) []:docker.registery.10.10.10.10.nip.io

#### [](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins#Create-secret-on-kubernetes)Create secret on kubernetes

    kubectl create secret tls docker-registry --cert=/opt/cert/registry.cert --key=/opt/cert/registry.key -n kube-registry

#### [](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins#Install-docker-registery-with-helm)Install docker-registery with helm
 
    helm install kube-registry stable/docker-registry \
    --namespace kube-registry \
    --set service.type=NodePort \
    --set persistence.enabled=true \
    --set persistence.accessModes=[ReadWriteOnce] \
    --set persistence.size=10Gi \
    --set persistence.storageClass=rook-ceph-block
 
#### [](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins#expose-docker-registery)Docker-Registry is Expose to the outside as https

    apiVersion: extensions/v1beta1
    kind: Ingress
    metadata:
      name: docker-registry
      namespace: kube-registry
      annotations:
        nginx.org/client-max-body-size: "2048M" #for nginx upload size of images
    spec:
      tls:
      - hosts:
        - docker.registery.10.10.10.10.nip.io
        secretName: docker-registry
      rules:
      - host: docker.registery.10.10.10.10.nip.io
        http:
          paths:
            - path: /
              backend:
                serviceName: kube-registry-docker-registry
                servicePort: 5000

#### [](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins#docker-registery)new certificates are added to the machines(all masters and workers)

    cp /opt/cert/registry.cert /etc/pki/ca-trust/source/anchors/

#command is run after moving certificates

    update-ca-trust extract
#docker is restarted on all servers after operation is completed

    systemctl restart docker

#### [](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins#docker-registery)Check that it works

    export NODE_PORT=$(kubectl get --namespace kube-registry -o jsonpath="{.spec.ports[0].nodePort}" services kube-registry-docker-registry)
    export NODE_IP=$(kubectl get nodes --namespace kube-registry -o jsonpath="{.items[0].status.addresses[0].address}")
    
    echo http://$NODE_IP:$NODE_PORT
    curl -X GET http://$NODE_IP:$NODE_PORT/v2/_catalog

![https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins](https://user-images.githubusercontent.com/3519706/71441033-ca95db00-2710-11ea-91a9-f229a7c1daef.png)

#### [](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins#docker-registery)Check docker-registry

    docker pull hello-world
    docker tag hello-world docker.registery.10.10.10.10.nip.io/hello-world
    docker push docker.registery.10.10.10.10.nip.io/hello-world

#### [](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins#permission)Give permisson for jenkins user

#docker

    chmod 777 /var/run/docker.sock

we do not recommend this method we suggest an another options([buildah](https://github.com/OktaySavdi/Devops/blob/master/Buildah/Java/readme.md) or podman)

#Kubernetes

    cp -rf /root/.kube/ /var/lib/jenkins/

#### [](https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins#Pipeline)Jenkins Pipeline


3.[jenkinsfile](jenkinsfile)

You can check image on registry

    curl -k https://docker.registery.10.10.10.10.nip.io/v2/_catalog
    curl -k https://docker.registery.10.10.10.10.nip.io/v2/websphere-liberty/tags/list

![https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins](https://user-images.githubusercontent.com/3519706/71444062-f7052380-271f-11ea-90b5-b45ccd633f58.png)

    http://myapplication-10.10.10.10.nip.io/webapp/

![https://github.com/OktaySavdi/Simple-DevOps-Project1-Java-Jenkins](https://user-images.githubusercontent.com/3519706/71469595-bdddb980-27da-11ea-84cf-8e799536e070.png)
