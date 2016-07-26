#FROM centos:7
FROM richardkeit/basepgbrm
MAINTAINER Richard Keit <rajkeit@gmail.com>
ENV server="BARMAN"
ENV sharedvolume /opt/sharedvol
## Install the Centos 7 Postgres 9.5 Repoistory

#RUN yum install -y  https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm \
#n/epel-release

#RUN yum install -y $(yum list |grep postgres |grep x86 |grep 9.5.3 | awk '{print $1}') \
#wget \
#gdal* \
#python-pip* \
#sudo \
#telnet \
#barman \ 
#openssh-server \
#&& ssh-keygen -A 



ADD startsshd.sh startsshd.sh 
RUN chmod 777 startsshd.sh 
CMD ./startsshd.sh & 


#USER barman

#RUN ssh-keygen -f id_rsa -t rsa -N '' \
#&& 