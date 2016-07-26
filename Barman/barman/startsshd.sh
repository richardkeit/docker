#!bin/bash -x

echo `whoami`

chmod 777 /keys
#su barman

#echo "Starting the SSH daemon"
server=$server


su $server <<'EOF'
#Uncomment the above once properly formatted



server=$server
echo "Server is $server"
hostname=`hostname`
echo "Hostname is $hostname"

whoami
cd ~
pwd


hostname=`hostname`
if [[ $server = "barman" ]]; then
        echo "Server type is barman"
        echo "Creating SSH keys for this server"

        if [[ ! -e "/var/lib/barman/.ssh/id_rsa" ]]; then
           ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
        else
           echo "File already exists"
        fi

echo "Adding this Key to the Shared Volume under Barman Directory"
		if [[ ! -d "/keys/${server}/$hostname" ]]; then
			mkdir -pv "/keys/${server}/$hostname"
		fi
		cp -v "/var/lib/barman/.ssh/id_rsa.pub" "/keys/${server}/$hostname/id_rsa.pub"

fi

if [[ $server = "postgres" ]]; then
        echo "Server type is postgres"
        echo "Creating SSH keys for this server"

        if [[ ! -e "/var/lib/pgsql/.ssh/id_rsa" ]]; then
           ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
        else
           echo "File already exists"
        fi

		echo "Adding this Key to the Shared Volume under Postgres Directory"
		if [[ ! -d "/keys/${server}/$hostname" ]]; then
			mkdir -pv "/keys/${server}/$hostname"
		fi
		cp -v "/var/lib/pgsql/.ssh/id_rsa.pub" "/keys/${server}/$hostname/id_rsa.pub"


fi
EOF


if [[ $server = "barman" ]]; then
        echo "Server is ${server} and will be copying the postgres ssh_pub to authorized keys"

        #Find relevant postgres public keys and add them to Barman auth keys
        declare -a array=()
		x=0

		for f in "/keys/postgres/*/*"; do
				array[x]=$f		        
		        x=+1
		        echo ${array[@]}

		        #Check if file exists before
		        if [[ ! -e "/var/lib/barman/.ssh/authorized_keys" ]]; then
		        	echo "Authorized keys did not exist, creating it now"
		        	touch "/var/lib/barman/.ssh/authorized_keys"
		        fi
		        echo "Inputting the postgres public key into the authorized_keys file"
		        cat $f >> /var/lib/barman/.ssh/authorized_keys
		done
	fi