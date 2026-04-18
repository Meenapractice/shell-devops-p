USERID=$(id -u)
LOGS_FOLDER="/home/ec2-user/repos/shell-devops-p/logs"
LOGS_FILE="$LOGS_FOLDER/$0.log"

mkdir -p $LOGS_FOLDER

if [ $? -ne 0 ]; then
    echo "Please run with root user" | tee -a $LOGS_FILE
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
      echo "Installing $2.. FAILURE" | tee -a $LOGS_FILE
      exit 1
    else
      echo "Installing $2.. SUCESS" | tee -a $LOGS_FILE
    fi
}

dnf install nginx -y &>>$LOGS_FILE
VALIDATE $? Nginx

dnf install mysql -y &>>$LOGS_FILE
VALIDATE $? mysql

dnf install nodejs -y &>>$LOGS_FILE
VALIDATE $? nodejs