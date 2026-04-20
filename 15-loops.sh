#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/home/ec2-user/repos/shell-devops-p"
LOGS_FILE="$LOGS_FOLDER/$0.log"

mkdir -p $LOGS_FOLDER

if [ USERID -ne 0 ]; then
  echo "Please run the script with root access" | tee -a $LOGS_FILE
  exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo "Installing $2.... FAILURE" | tee -a $LOGS_FILE
        exit 1
    else
        echo "Installing $2.... SUCCESS" | tee -a $LOGS_FILE
}

for package in $@; do
  dnf list installed $package
  if [ $? -ne 0 ]; then
    echo "$package not installed..Installing now"
    dnf install $package -y
    VALIDATE $? $package
    exit 1
  else
    echo "$package already installed..SKIPPING"
  fi
  done
    