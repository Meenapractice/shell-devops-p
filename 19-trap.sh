#!/bin/bash

set -e

trap "echo 'There is an error is line number $LINENO: command is $BASHCOMMAND'" ERR

echo "I am first line"
echoo "there is error in my line"
echo " I am third line"