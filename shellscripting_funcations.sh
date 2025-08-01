#!/bin/bash
ID=$(id -u)

VALIDATE_ROOT() {
    if [ "$1" -ne 0 ]; then
        echo "ERROR:: $2.... failed to run this script as root or with sudo."
        exit 1
    else 
        echo "$2.... running as root."
    fi
}

if [ $ID -ne 0 ]; then
    echo "ERROR:: You must run this script as root or with sudo."
    exit 1
else
   echo "Running as root."
fi

yum install mysql-server -y

VALIDATE_ROOT $? "MySQL server installation"

yum install git -y
VALIDATE_ROOT $? "Git installation"

