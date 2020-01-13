# Install & configure Maven build tool

Maven is a code build tool which used to convert your code to an artifact. this is a widely used plugin to build in continuous integration

#### [](https://github.com/OktaySavdi/Project1#install-maven-on-jenkins)Install Maven

1.  Download maven packages  [https://maven.apache.org/download.cgi](https://maven.apache.org/download.cgi)
In this case, I am using /opt/maven as my installation directory

-   Link :  [https://maven.apache.org/download.cgi](https://maven.apache.org/download.cgi)
    
#Creating maven directory under /opt

    mkdir /opt/maven
    cd /opt/maven
    #downloading maven version 3.6.0
    wget http://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
    tar -xvzf apache-maven-3.6.3-bin.tar.gz
        

1.  Setup M2_HOME and M2 paths in .bash_profile of the user and add these to the path variable

`

    vi ~/.bash_profile
    M2_HOME=/opt/maven/apache-maven-3.6.1
    M2=$M2_HOME/bin
    PAHT=<Existing_PATH>:$M2_HOME:$M2
    source .bashrc

#### [](https://github.com/OktaySavdi/Project1#checkpoint)Checkpoint

logoff and login to check maven version
    
    mvn --version
