#!/bin/bash

#Author: Akoleme ADIKPETO
#Date: Feb 22, 2022

echo "Installing some packages....."
sleep 4

yum install net-tools -y

if [ $? -eq 0 ] 
then 
echo "net-tools package successfully installed"
else
echo "Could not downlaod package"
fi

yum install sysstat -y

if [ $? -eq 0 ] 

then 
echo "sysstat package successfully installed"
else
echo "Could not downlaod package"
fi

yum install wget -y
if [ $? -eq 0 ] 

then
echo "wget package successfully installed"
else
echo "Could not downlaod package"
fi
yum install git -y
if [ $? -eq 0 ] 

then
echo "git package successfully installed"
else
echo "Could not downlaod package"
fi
yum install tree -y
if [ $? -eq 0 ] 

then
echo "tree package successfully installed"
else
echo "Could not download package"
fi
yum install vim -y
if [ $? -eq 0 ] 

then
echo "vim package successfully installed"
else
echo "Could not download package"
sleep 3
echo "All packages successfully installed"
fi
