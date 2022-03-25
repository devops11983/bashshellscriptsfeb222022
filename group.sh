#!/bin/bash

#Author:Akoleme ADIKPETO
#Date: Feb 28 2022

#Description : write a script to check if group exist. it should ask for the group name, and then check the system automatically.

# Check group

echo -n "Please enter the group name:  "
read GROUP_NAME

grep ${GROUP_NAME} /etc/group > /dev/null 2>&1

if
  [ $? -eq 0 ]

  then
echo
  echo "group  ${GROUP_NAME} exist on this system"
  echo
  else
echo
  echo "Group ${GROUP_NAME} does not exist "
echo
  fi
