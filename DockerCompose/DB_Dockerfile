FROM centos:7
MAINTAINER Richard Keit <rajkeit@gmail.com>
ENV PGDATA /opt/postgres/data
ENV POSTGRESPASS postgres

## Install the Centos 7 Postgres 9.5 Repoistory

RUN yum install -y  https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm \
epel-release

RUN yum install -y $(yum list |grep postgres |grep x86 |grep 9.5.3 | awk '{print $1}') \ 
wget \
gdal* \
python-pip* \
sudo \
postgis2_95* \
&& echo $POSTGRESPASS > /opt/pw && mkdir -p /opt/postgres/data && chown -R postgres:postgres /opt/

USER postgres

RUN /usr/pgsql-9.5/bin/initdb -E UTF8 --lc-collate=en_US.UTF-8 --lc-ctype=en_US.UTF-8 --lc-messages=en_US.UTF-8 --lc-monetary=en_US.UTF-8 --lc-numeric=en_US.UTF-8 --lc-time=en_US.UTF-8 -D /opt/postgres/data/ --pwfile=/opt/pw

####
# Create postgresql.conf and pg_hba.conf file per template
####


RUN echo "host all all all md5" >> $PGDATA/pg_hba.conf && echo "listen_addresses='*'" >> $PGDATA/postgresql.conf 


RUN /usr/pgsql-9.5/bin/pg_ctl -D $PGDATA start ; sleep 2 && createuser ipss && createdb -E UTF8 -O ipss ipss && \
	psql ipss -c "CREATE EXTENSION postgis;" \
	#&& \
	#psql ipss -c "SELECT name, default_version, \ 
	#installed_version FROM pg_available_extensions \
	#WHERE name LIKE 'postgis%' ;" \
	&& psql ipss -c "ALTER TABLE geometry_columns OWNER TO ipss;" \ 
	&& psql ipss -c "ALTER TABLE spatial_ref_sys OWNER TO ipss;" \
	&& psql ipss -c "SELECT ST_GeomFromText('POINT(-71.064 42.287)');"
	
EXPOSE 5432

VOLUME ["/opt/postgres/data/pg_log", "/usr/pgsql-9.5/bin" , "/etc/postgresql"]


CMD /usr/pgsql-9.5/bin/postgres -D $PGDATA -c config_file=$PGDATA/postgresql.conf
	

