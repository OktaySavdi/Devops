![https://github.com/OktaySavdi/Devops/tree/master/Tekton/java](https://user-images.githubusercontent.com/3519706/71954112-486be300-31f5-11ea-944e-01285a6d1a9e.png)

Overview
On Tekton, we will learn how to develop CI / CD processes in an automated manner with a pipeline mechanism.

We will create the pipeline for a Java application. The pipeline will first build the binary, create a docker image from it, push the image to Docker repo, then deploy it on the Kubernetes cluster using its Tekton.

## Installing Tekton Pipelines
To add the Tekton Pipelines component to an existing cluster:
1.  Run the  [`kubectl apply`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#apply)  command to install  [Tekton Pipelines](https://github.com/tektoncd/pipeline)  and its dependencies:
`kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml`

2.  Run the  [`kubectl get`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#get)  command to monitor the Tekton Pipelines components until all of the components show a  `STATUS`  of  `Running`:
`kubectl get pods --namespace tekton-pipelines`

`Tip`: Instead of running the  `kubectl get`  command multiple times, you can append the  `--watch`  flag to view the component's status updates in real time. Use CTRL + C to exit watch mode.

## Install Dashboard

### [](https://github.com/OktaySavdi/Devops/tree/master/Tekton/java#installing-the-latest-release)Installing the latest release
1.  Run the  [`kubectl apply`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#apply)  command to install the  [Tekton Dashboard](https://github.com/tektoncd/dashboard)  and its dependencies:
`kubectl apply --filename https://github.com/tektoncd/dashboard/releases/download/v0.3.0/dashboard-latest-release.yaml`

2.  Run the  [`kubectl get`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#get)  command to monitor the Tekton Dashboard component until all of the components show a  `STATUS`  of  `Running`:
`kubectl get pods --namespace tekton-pipelines`

`Tip`: Instead of running the  `kubectl get`  command multiple times, you can append the  `--watch`  flag to view the component's status updates in real time. Use CTRL + C to exit watch mode.

# Tekton Pipelines cli
[Install URL](https://github.com/tektoncd/cli)
### Installing  `tkn`

#### Linux RPMs

If you are running on any of the following rpm based distros:

-   Fedora30
-   Fedora31
-   Centos7
-   Centos8
-   EPEL
-   RHEL8

On any other RPM based distros, you can install the rpm directly:

    rpm -Uvh https://github.com/tektoncd/cli/releases/download/v0.6.0/cli_0.6.0_Linux-64bit.rpm

### [](https://github.com/OktaySavdi/Devops/tree/master/Tekton/java#install-yaml-file)Install yaml file

    kubectl create -f tekton/*

### [](https://github.com/OktaySavdi/Devops/tree/master/Tekton/java#install-yaml-file)Check Status

    tkn pipelinerun list
    tkn pipelinerun describe maven-java-pipelinerun
    
![https://github.com/OktaySavdi/Devops/tree/master/Tekton/java](https://user-images.githubusercontent.com/3519706/71955955-d72f2e80-31fa-11ea-870f-1c1158bb5b76.png)

    tkn pipelinerun logs maven-java-pipelinerun
    tkn taskrun logs maven-java-pipelinerun-build-rjrnt
    
![https://github.com/OktaySavdi/Devops/tree/master/Tekton/java](https://user-images.githubusercontent.com/3519706/71956044-15c4e900-31fb-11ea-88fa-785e27f85c2e.png)

    tkn taskrun list
    tkn taskrun describe maven-java-pipelinerun-build-rjrnt
    
![https://github.com/OktaySavdi/Devops/tree/master/Tekton/java](https://user-images.githubusercontent.com/3519706/71956097-4dcc2c00-31fb-11ea-94dd-11b0c72addc7.png)

### [](https://github.com/OktaySavdi/Devops/tree/master/Tekton/java#tekton-web-console)Let's look through the web console

![https://github.com/OktaySavdi/Devops/tree/master/Tekton/java](https://user-images.githubusercontent.com/3519706/71956390-1a3dd180-31fc-11ea-8d36-1f119bdc6252.png)

![https://github.com/OktaySavdi/Devops/tree/master/Tekton/java](https://user-images.githubusercontent.com/3519706/71956467-4eb18d80-31fc-11ea-889f-38fcd7a60c52.png)

![https://github.com/OktaySavdi/Devops/tree/master/Tekton/java](https://user-images.githubusercontent.com/3519706/71956826-2f673000-31fd-11ea-9d03-4736d7e139fd.png)
