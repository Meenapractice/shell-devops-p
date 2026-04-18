#!/bin/bash

NUM1=$1
NUM2=$2

if [ $# -ne 2 ]; then
  echo "2 arguments are required"
  exit 1
fi

if [ $NUM1 -lt $NUM2 ]; then
    echo "$NUM2 is greater than $NUM1"
elif [ $NUM1 -eq $NUM2 ]; then
  echo "$NUM1 and $NUM2 are equal"
else
  echo "$NUM1 is greater than $NUM2"
fi