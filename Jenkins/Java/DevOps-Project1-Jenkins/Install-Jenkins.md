# Install Jenkins


### [](https://github.com/OktaySavdi/Project1#prerequisites)Prerequisites

1.  Required
    -   With Internet Access
    -   Security Group with Port  `8080`  open for internet
2.  Java v1.8.x

## [](https://github.com/OktaySavdi/Project1#Install-Java)Install Java

1.  We will be using open java for our demo, Get the latest version from  [http://openjdk.java.net/install/](http://openjdk.java.net/install/)
    
    yum install java-1.8*
    #yum -y install java-1.8.0-openjdk
    
2.  Confirm Java Version and set the java home
	
	java -version
	
	find /usr/lib/jvm/java-1.8* | head -n 3
    
	JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.181-7.b13.el7.x86_64
	
	export JAVA_HOME
	
	PATH=$PATH:$JAVA_HOME

**#To set it permanently update your .bashrc**
    
    vi ~/.bashrc
    
    source .bashrc 
    
_The output should be something like this,_

**[root@~]# java -version**

openjdk version "1.8.0_181"

OpenJDK Runtime Environment (build 1.8.0_181-b13)

OpenJDK 64-Bit Server VM (build 25.181-b13, mixed mode)
    

## [](https://github.com/OktaySavdi/Project1#Install-jenkins)Install Jenkins

You can install jenkins using the rpm or by setting up the repo. We will set up the repo so that we can update it easily in the future.

1.  Get the latest version of jenkins from  [https://pkg.jenkins.io/redhat-stable/](https://pkg.jenkins.io/redhat-stable/)  and install
    
    yum -y install wget
    
    sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    
    yum -y install jenkins
    
### Start Jenkins

    # Start jenkins service
    service jenkins start
    
    # Setup Jenkins to start at boot,
    chkconfig jenkins on   
    
## [](https://github.com/OktaySavdi/Project1#accessing-jenkins)Accessing Jenkins

By default jenkins runs at port  `8080`, You can access jenkins at
    
    http://YOUR-SERVER-PUBLIC-IP:8080
    

#### [](https://github.com/OktaySavdi/Project1#configure-jenkins)Configure Jenkins

-   The default Username is  `admin`
-   Grab the default password
-   Password Location:`/var/lib/jenkins/secrets/initialAdminPassword`
-   `Skip`  Plugin Installation;  _We can do it later_
-   Change admin password
    -   `Admin`  >  `Configure`  >  `Password`
-   Configure  `java`  path
    -   `Manage Jenkins`  >  `Global Tool Configuration`  >  `JDK`
-   Create another admin user id

### [](https://github.com/OktaySavdi/Project1#test-jenkins-jobs)Test Jenkins Jobs

1.  Create “new item”
2.  Enter an item name –  `My-First-Project`
    -   Chose  `Freestyle`  project
3.  Under the Build section Execute shell: echo "Welcome to Jenkins"
4.  Save your job
5.  Build job
6.  Check "console output"
