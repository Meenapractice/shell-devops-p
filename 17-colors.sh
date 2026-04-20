#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/home/ec2-user/repos/shell-devops-p"
LOGS_FILE="$LOGS_FOLDER/$0.log"

R='\e[31m'
Y='\e[32m'
G='\e[33m'
N='\e[0m'

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]; then
  echo "$R Please run the script with root access $N" | tee -a $LOGS_FILE
  exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo "Installing $2.... $R FAILURE $N" | tee -a $LOGS_FILE
        exit 1
    else
        echo "Installing $2.... $G SUCCESS $N" | tee -a $LOGS_FILE
    fi
}

for package in $@; do
  dnf list installed $package &>>LOGS_FILE
  if [ $? -ne 0 ]; then
    echo "$package not installed..$G Installing now $N" | tee -a $LOGS_FILE
    dnf install $package -y &>>LOGS_FILE
    VALIDATE $? $package
    exit 1
  else
    echo "$package already installed..$Y SKIPPING $N" | tee -a $LOGS_FILE
  fi
  done
    