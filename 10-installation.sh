#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "Please run the script with root user"
  exit 1
fi

dnf install nginnx -y
if [ $? -ne 0 ]; then
  echo "Installing nginx..FAILURE"
  exit 1
else
  echo "Installing nginx..SUCESS"
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
  echo "Installing mysql..FAILURE"
  exit 1
else
  echo "Installing mysql..SUCESS"
fi

dnf install nodejs -y
if [ $? -ne 0 ]; then
 echo "Installing nodejs..FAILURE"
  exit 1
else
  echo "Installing nodejs..SUCESS"
fi

