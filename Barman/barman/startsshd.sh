#!bin/bash
server="BARMAN"
echo `whoami`

whoami
cd ~
pwd
if [[ $server = "BARMAN" ]]; then
        echo "Server type is BARMAN"
        echo "Creating SSH keys for this server"

        if [[ ! -e "/var/lib/barman/.ssh/id_rsa" ]]; then
           ssh-keygen -f id_rsa -t rsa -N ''
        else
           echo "File already exists"
        fi

echo "Adding this Key to the Shared Volume under Barman Directory"


fi
