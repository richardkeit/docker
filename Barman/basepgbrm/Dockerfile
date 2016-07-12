FROM centos:7
MAINTAINER Richard Keit <rajkeit@gmail.com>
ENV PGDATA /opt/postgres/data
ENV POSTGRESPASS postgres

## Build with Docker build -t richardkeit/basepgbrm .


## Install the Centos 7 Postgres 9.5 Repoistory

RUN yum install -y  https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm \
epel-release

RUN yum install -y $(yum list |grep postgres |grep x86 |grep 9.5.3 | awk '{print $1}') \ 
wget \
gdal* \
python-pip* \
sudo \
postgis2_95* \
telnet \
barman \
openssh-server \
&& ssh-keygen -A 