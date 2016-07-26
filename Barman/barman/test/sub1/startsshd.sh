#!bin/bash -x

echo `whoami`

chmod 777 /keys
#su barman

su barman <<'EOF'

server=$server
echo "Server is $server"
hostname=`hostname`
echo "Hostname is $hostname"

whoami
cd ~
pwd


hostname=`hostname`
if [[ $server = "BARMAN" ]]; then
        echo "Server type is BARMAN"
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
EOF