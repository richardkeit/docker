FROM centos:7
MAINTAINER Richard Keit <rajkeit@gmail.com>

# Install base deps
RUN yum install -y net-tools pwgen wget curl tar unzip mlocate logrotate telnet vim 

# Install base the EPEL repo
RUN yum -y install epel-release


# Install RabbitMQ deps
RUN rpm --import https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
RUN yum install -y erlang
RUN yum install -y http://www.rabbitmq.com/releases/rabbitmq-server/v3.5.6/rabbitmq-server-3.5.6-1.noarch.rpm

# Allow triggerable events on the first time running
RUN touch /tmp/firsttimerunning
