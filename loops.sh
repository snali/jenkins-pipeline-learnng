ID=($id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE="/tmp/$0.log"
echo "script started at $(date)" > $LOGFILE
echo -e "${Y}Log file: $LOGFILE${N}"

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "${R}Error: $2 Command failed with exit code $1${N}"
        exit 1
    else
        echo -e "${G}$2 ..... Success${N}"
    fi
}

if [$id -ne 0];then
    echo -e "$R ERROR:: You must run this script as root or with sudo.$N"
    exit 1
else
   echo -e "${G}Running as root.${N}"
fi 

for package in $@
do
    yum install $package -y &>> /tmp/$0.log
    VALIDATE $? "$package installation"
    if [ $? -ne 0 ]; then
        echo -e "${R}Failed to install $package${N}"
    else
        echo -e "${G}$package installed successfully${N}"
    fi
done
