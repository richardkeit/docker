FROM centos:7
MAINTAINER Richard Keit <rajkeit@gmail.com>

##################################
# Install EPEL repo
##################################
RUN yum -y install epel-release \

###################################
# Installing gdal1.11, psycopg2, wget
# gcc gcc-c++ python-devel make
# python-lxml gdal gdal-devel
# libxslt-devel libxml2-devel
###################################

&& yum install -y \
make \
gdal-python.x86_64 \
python-psycopg2.x86_64 \
wget \
gcc \
gcc-c++ \
python-devel \
python-lxml \
gdal \
gdal-devel \
libxslt-devel \
libxml2-devel \ 
python-reportlab

##################################
# Adding get-pip.py, 
# libspatialindex & pipinstall.sh
# Update Pip
##################################

RUN wget https://bootstrap.pypa.io/get-pip.py \
&& mkdir /tmp/spatialindex \
&& wget --directory-prefix=/tmp/spatialindex/ http://download.osgeo.org/libspatialindex/spatialindex-src-1.7.0.tar.gz \
&& python get-pip.py

COPY pipinstall.sh /tmp/

##################################
# Build SpatialIndex
# Credit pvillard/agdc-docker
#################################

RUN tar -xvzf /tmp/spatialindex/spatialindex-src-1.7.0.tar.gz -C /tmp/spatialindex \
&& cd /tmp/spatialindex/spatialindex-src-1.7.0/ \
&& ./configure; make; make install \
&& echo export LD_LIBRARY_PATH=/usr/local/lib/ >> /root/.bashrc && source /root/.bashrc \
&& pip install Rtree


#################################
# Install other Pip modules
################################


RUN /tmp/pipinstall.sh && pip list && mkdir -p /opt/webapp
#ADD . /opt/webapp/

EXPOSE 5000
#CMD python /opt/webapp/app.py



