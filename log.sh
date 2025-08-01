ID=$(id -u)
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Error: $2 Command failed with exit code $1"
        exit 1
        else
        echo "$2 ..... Success"
    fi
}

if [ $ID -ne 0 ]; then
    echo "ERROR:: You must run this script as root or with sudo."
    exit 1
else
   echo "Running as root."
fi

yum install mysql-server -y &>> $LOGFILE
VALIDATE $? "MySQL server installation"

yum install git -y &>> $LOGFILE
VALIDATE $? "Git installation"
