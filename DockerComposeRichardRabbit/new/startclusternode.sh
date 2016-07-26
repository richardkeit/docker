#!/bin/bash
## Based on Jay-Johnson ###
## Appends by Richard Keit <rajkeit@gmail.com>

logfile="/tmp/rabbitnode.log"
touch $logfile
cookieFile='/var/lib/rabbitmq/.erlang.cookie'

if [ "$CLUSTER_WITH" = "rabbit1" ] ;
then

 echo "Starting Clustered Server Instance as a DETACHED single instance"
echo "$RABBITMQ_ERLANG_COOKIE" > "$cookieFile"
chmod 600 "$cookieFile" ; chown rabbitmq:rabbitmq "$cookieFile"
    /usr/sbin/rabbitmq-server -detached >> $logfile

    echo "Stopping App with /usr/sbin/rabbitmqctl stop_app"
    /usr/sbin/rabbitmqctl stop_app >> $logfile

    /usr/sbin/rabbitmqctl join_cluster rabbit@$CLUSTER_WITH >> $logfile

    echo "Starting App"
    /usr/sbin/rabbitmqctl start_app >> $logfile

    echo `/usr/sbin/rabbitmqctl cluster_status` 
    echo "Done Starting Cluster Node"
    tail -f /tmp/rabbitnode.log 

else
echo "$RABBITMQ_ERLANG_COOKIE" > "$cookieFile"
chmod 600 "$cookieFile" ;  chown rabbitmq:rabbitmq "$cookieFile"

    /usr/sbin/rabbitmq-server -detached >> $logfile

tail -f /tmp/rabbitnode.log



fi



