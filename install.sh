#!/bin/bash

#
#   -c  -> sadece host dosyasını değiştirir
#   -h  -> help
#

############################################################
#                       FUNCTIONS
############################################################

function addHostnameToHosts {

    ##############################
    # -1- DEV ENVIRONMENT VARIABLES
    ##############################
    FILE="/etc/hosts"
    VAGRANT_IP="192.168.56.101"
    HOSTNAME="local.guppy.com.tr"
    PRELINE="# GUPPY HOSTNAME LIST"
    LINE="$PRELINE\n$VAGRANT_IP\t$HOSTNAME\twww.$HOSTNAME"


    ##############################
    # -2- INSERT HOSTNAME TO /etc/hosts
    ##############################

    if [ -n "$(grep $HOSTNAME $FILE)" ]
        then
            echo "$HOSTNAME already exists : $(grep $HOSTNAME $FILE)"
        else
            echo "Adding $HOSTNAME to your $FILE";
            sudo -- sh -c -e "echo '$LINE' >> $FILE";

            if [ -n "$(grep $HOSTNAME $FILE)" ]
                then
                    echo "$HOSTNAME was added succesfully \n $(grep $HOSTNAME $FILE)";
                else
                    echo "Failed to Add $HOSTNAME, Try again!";
            fi
    fi

}

function installDevEnv {

    cd vagrant/

    echo "--- --- --- GUPPY --- --- ---";
    echo "vagrant box update called";
    #vagrant box update

    echo "--- --- --- GUPPY --- --- ---";
    echo "vagrant up called";
    #vagrant up

    echo "--- --- --- GUPPY --- --- ---";
    echo "Trying to change $FILE file";
    #addHostnameToHosts

}


############################################################
#                       RUN
############################################################

echo "GUPPY Development Environment is preparing ...";

if [ $# -gt 0 ]
    then
    if [ $1 = "-c" ]
        then
            echo "Trying to change $FILE file";
            addHostnameToHosts
        else
            installDevEnv
    fi

    else
        installDevEnv
fi

echo "GUPPY Development Environment was prepared succesfully :)";

exit 0;
