#!/bin/bash

echo "Arguments passed to the script is $@"
echo "No of arguments passed to the script $#"
echo "Name of the script $0"
echo "PID of the script $$"
echo "User is $USER"
echo "PWD is $PWD"
echo "Home directory is $HOME"
sleep 10 &
echo "Last process that went to background is $!"
npm install nginx
echo "last process failed is $?"