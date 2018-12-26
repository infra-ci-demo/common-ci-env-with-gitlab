# GitLab CI with container

Prepare the latest docker & docker-compose for CentOS7
```
yum update -y
yum install -y yum-utils device-mapper-persistent-data lvm2 git
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
```

```
vi /usr/lib/systemd/system/docker.service
---
ExecStart=/usr/bin/dockerd -H unix://
  ↓
ExecStart=/usr/bin/dockerd --insecure-registry 192.168.33.10:4567 -H unix://
---
```
It's necessary to change to an ip address that can access from external network.

```
systemctl enable docker

reboot
```

```
docker run -d \
           -p 80:80 -p 443:443 -p 4567:4567 \
           -h gitlab.example.com \
           --name gitlab \
           --restart always \
           -v ./volumes/gitlab.rb:/etc/gitlab/gitlab.rb:Z \
           -v ./volumes/data:/var/opt/gitlab:Z \
           -v ./volumes/logs:/var/log/gitlab:Z \
           gitlab/gitlab-ce:11.5.4-ce.0
```
