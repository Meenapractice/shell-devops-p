#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "Please run the script with root access"
  exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo "Installing $2...FAILURE"
      exit 1
    else
      echo "Installing $2... SUCCESS"
    fi
}

dnf install nginx -y
VALIDATE $? Nginx

dnf install mysql -y
VALIDATE $? mysql

dnf install nodejs -y
VALIDATE $? nodejs