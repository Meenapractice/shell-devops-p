#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "Please run the script with root user"
  exit 1
fi

dnf install nginx -y
if [ $? -ne 0 ]; then
  echo "Nginx installed..FAILURE"
  exit 1
else
  echo "Nginx installing..SUCESS"
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
  echo "mysql installed..FAILURE"
  exit 1
else
  echo "mysql installing..SUCESS"
fi

dnf install nodejs -y
if [ $? -ne 0 ]; then
 echo "mysql installed..FAILURE"
  exit 1
else
  echo "mysql installing..SUCESS"
fi

