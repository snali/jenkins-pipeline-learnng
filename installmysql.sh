#!/bin/bash
ID=$(id -u)
if [ "$ID" -ne 0 ]; then
    echo "ERROR:: You must run this script as root or with sudo."
    exit 1
fi
yum install mysql-server -y
if [ $? -ne 0 ]; then
    echo "ERROR:: Failed to install MySQL server."
    exit 1
fi
systemctl start mysqld
if [ $? -ne 0 ]; then
    echo "ERROR:: Failed to start MySQL server."
    exit 1
fi
systemctl enable mysqld
if [ $? -ne 0 ]; then
    echo "ERROR:: Failed to enable MySQL server to start on boot."
    exit 1
fi
echo "MySQL server installed and started successfully."
echo "You can secure your MySQL installation by running 'mysql_secure_installation'."
echo "Please remember to set a root password and configure your MySQL server as needed."
exit 0
# End of installmysql.sh
# This script installs MySQL server, starts it, and enables it to start on boot.
# It checks for root privileges and handles errors during installation and service management.
# Make sure to run this script on a compatible system with yum package manager.