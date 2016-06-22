FROM centos:7
MAINTAINER Richard Keit <rajkeit@gmail.com>

##################################
# Install EPEL repo
##################################
RUN yum -y install epel-release \

###################################
# Installing gdal1.11, psycopg2, wget
###################################

&& yum install -y gdal-python.x86_64 python-psycopg2.x86_64 wget

##################################
# Adding get-pip.py & pipinstall.sh
##################################

ADD https://bootstrap.pypa.io/get-pip.py . 
COPY pipinstall.sh /tmp/

##################################
# Upgrade Pip, required pip module
#################################

RUN python get-pip.py && /tmp/pipinstall.sh && pip list
