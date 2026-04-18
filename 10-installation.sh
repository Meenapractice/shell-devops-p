#!/bin/bash

USERID=$(id -u)

if [ $? -ne 0 ]; then
  echo "Please run the script with root user"
  exit 1
fi

dnf install nginx
if [ $? -ne 0 ]; then
  echo "Nginx not installed..Installing..SUCESS"
else
  echo "Nginx already installed.. FAILURE"
fi

dnf install mysql
if [ $? -ne 0 ]; then
  echo "mysql not installed..Installing..SUCESS"
else
  echo "mysql already installed.. FAILURE"
fi

dnf install nodejs
if [ $? -ne 0 ]; then
  echo "nodejs not installed..Installing..SUCESS"
else
  echo "nodejs already installed.. FAILURE"
fi

