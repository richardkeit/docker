FROM rabbitmq:3
MAINTAINER Richard Keit <rajkeit@gmail.com>

###### Used the base RabbitMQ image as it works well! #######

##### Set the ENV var to have the same cookie for clustering ##
ENV RABBITMQ_ERLANG_COOKIE=richardrabbit


EXPOSE 1883
EXPOSE 8883
EXPOSE 5672
EXPOSE 15672
EXPOSE 25672
EXPOSE 4369
EXPOSE 9100
EXPOSE 9101
EXPOSE 9102
EXPOSE 9103
EXPOSE 9104
EXPOSE 9105

ADD startclusternode.sh /var/lib/rabbitmq/startclusternode.sh
ENTRYPOINT /var/lib/rabbitmq/startclusternode.sh

