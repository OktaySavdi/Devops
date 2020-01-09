# [](https://github.com/OktaySavdi/Simple-DevOps-Project5-Java-Gitlab)Install Github

    wget https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/7/gitlab-ce-12.6.1-ce.0.el7.x86_64.rpm
    yum localinstall gitlab-ce-12.6.1-ce.0.el7.x86_64.rpm -y
    vi /etc/gitlab/gitlab.rb
    external_url 'https://gitlab.example.com'
    gitlab-ctl reconfigure
    [Install Github Example](https://www.vultr.com/docs/how-to-install-gitlab-community-edition-ce-11-x-on-centos-7)

# [](https://github.com/OktaySavdi/Simple-DevOps-Project5-Java-Gitlab)Install Runner

    wget https://packages.gitlab.com/runner/gitlab-runner/packages/fedora/29/gitlab-runner-12.6.0-1.x86_64.rpm
    yum localinstall gitlab-runner-12.6.0-1.x86_64.rpm -y

# [](https://github.com/OktaySavdi/Simple-DevOps-Project5-Java-Gitlab)Install Git Last Version

    #https://www.digitalocean.com/community/tutorials/how-to-install-git-on-centos-7
    sudo yum groupinstall "Development Tools" -y
    sudo yum install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel -y
    wget https://github.com/git/git/archive/v2.25.0-rc0.tar.gz -O git.tar.gz
    tar -zxf git.tar.gz
    cd git-*
    make configure
    ./configure --prefix=/usr/local
    sudo make install
    git --version

# [](https://github.com/OktaySavdi/Simple-DevOps-Project5-Java-Gitlab)Runner Integration on Gitlab

    create new project
    Project > settings > CI/CD > Runner

on server:  gitlab-runner register

![# [](https://github.com/OktaySavdi/Simple-DevOps-Project5-Java-Gitlab)](https://user-images.githubusercontent.com/3519706/71579623-83438c00-2b0e-11ea-8558-ba52b60453f1.png)

![# [](https://github.com/OktaySavdi/Simple-DevOps-Project5-Java-Gitlab) ](https://user-images.githubusercontent.com/3519706/71579558-3495f200-2b0e-11ea-9a41-34fdbe6440cc.png)

![https://github.com/OktaySavdi/Simple-DevOps-Project5-Java-Gitlab](https://user-images.githubusercontent.com/3519706/71579662-bbe36580-2b0e-11ea-8624-504e8e3c816b.png)
