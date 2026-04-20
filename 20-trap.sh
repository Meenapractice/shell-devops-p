#!/bin/bash

set -e

trap "echo 'There is an error in $BASH_COMMAND'" ERR

USERID=$(id -u)
LOGS_FOLDER="/home/ec2-user/repos/shell-devops-p"
LOGS_FILE="$LOGS_FOLDER/$0.log"

R='\e[31m'
Y='\e[32m'
G='\e[33m'
N='\e[0m'

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]; then
  echo -e "$R Please run the script with root access $N" | tee -a $LOGS_FILE
  exit 1
fi


for package in $@; do
  dnf list installed $package &>>$LOGS_FILE
  if [ $? -ne 0 ]; then
    echo -e "$package not installed..$G Installing now $N" | tee -a $LOGS_FILE
    dnf install $package -y &>>$LOGS_FILE
    exit 1
  else
    echo -e "$package already installed..$Y SKIPPING $N" | tee -a $LOGS_FILE
  fi
  done
    