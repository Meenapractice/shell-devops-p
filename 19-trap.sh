#!/bin/bash

set -e

trap "echo 'There is an error is line number $LINENO: command is $BASH_COMMAND'" ERR

echo "I am first line"
echoo "there is error in my line"
echo " I am third line"