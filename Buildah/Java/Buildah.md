### [Fedora](https://www.fedoraproject.org/),  [CentOS](https://www.centos.org/)

    sudo yum -y install buildah

### RHEL, CentOS

In RHEL and CentOS 7, ensure that you are subscribed to the  `rhel-7-server-rpms`,  `rhel-7-server-extras-rpms`,  `rhel-7-server-optional-rpms`  and  `EPEL`  repositories, then run this command:

```
 yum -y install \
    make \
    golang \
    bats \
    btrfs-progs-devel \
    device-mapper-devel \
    glib2-devel \
    gpgme-devel \
    libassuan-devel \
    libseccomp-devel \
    git \
    bzip2 \
    go-md2man \
    runc \
    skopeo-containers
```
**Error1**
[`gitlab-runner`@buildah-server]$ `buildah`
Error during unshare(CLONE_NEWUSER): Invalid argument
User namespaces are not enabled in `/proc/sys/user/max_user_namespaces`.
ERRO[0000] error parsing PID "": strconv.Atoi: parsing "": invalid syntax
ERRO[0000] (unable to determine exit status)

**Solution:**

    echo 1 > /proc/sys/user/max_user_namespaces
    echo "user.max_user_namespaces=15000" >> /etc/sysctl.conf

**Error2**
Writing manifest to image destination
Storing signatures
level=error msg="**Error while applying layer: ApplyLayer exit status 1 stdout:  stderr: there might not be enough IDs available in the namespace** (requested 0:42 for /etc/gshadow): lchown /etc/gshadow: invalid argument"

**Solution:** 
vi /etc/subuid 

    gitlab-runner:165536:65536

vi /etc/subgid

    gitlab-runner:165536:65536
