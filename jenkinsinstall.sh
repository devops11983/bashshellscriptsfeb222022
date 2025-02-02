#!/bin/bash

#Author: Akoleme ADIKPETO
#Date: March 1st, 2022

##This script is to automate the installing Jenkins on a CentOS 7 system using the official Jenkins repository.

echo -e  "\n We will now start to download Jenkins...\n "

if

 [ ${USER} != root ]

then 

echo -e "\n You are not the root user so you can't run this script!\n "
exit 100 
else 
echo -e "\n You are the root user and you are good to go\n"
fi

sleep 5

echo -e "\n Before we can install Jenkins, we need to have Java installed in our system\n"

sudo yum install java-1.8.0-openjdk-devel -y

if 
[ $? -ne 0 ]

then 
echo -e "\n Issue with installing Java\n "
exit 100
fi 

sleep 5
echo -e "\nNow we need to enable the Jenkins repository...\n "
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo 

if 
[ $? -ne 0 ]

then
echo -e "\nIssue with enabling the Jenkins repository\n "
exit 100

elif 
[ $? -ne 0 ]
then
sudo yum install wget -y
fi

if 
[ $? -ne 0 ]

then
echo -e "\nIssue with installing wget\n "
exit 100
sleep 5

echo -e "\nNow we disable key check on the repo\n "

#sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

#if 
#[ $? -ne 0 ]

#then
#echo -e "\n Issue with disabling the keycheck on the repo\n"
#exit 100
#fi
sleep 5
echo -e "\n Now we will install the latest stable version of Jenkins.\n "

sudo yum install jenkins -y
if 
[ $? -ne 0 ]

then
echo -e "\n Issue with installing Jenkins\n "
exit 100
fi
sleep 5
echo -e "\n Now we can start and enable the Jenkins service...\n "

sudo systemctl start jenkins
if 
[ $? -ne 0 ]

then
echo -e "\n Issue with starting Jenkins\n"
exit 100
fi 
sleep 5
sudo systemctl enable jenkins
if 
[ $? -ne 0 ]

then
echo -e "\n Issue with enabling Jenkins\n"
exit 100
fi
sleep 5
echo -e "\n Now we can open the ports necessary for Jenkins to work\n "

sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp 
if 
[ $? -ne 0 ]

then
echo -e "\n Issue with opening ports\n"
exit 100
fi
sudo firewall-cmd --reload
if 
[ $? -ne 0 ]

then
echo -e "\n Issue with reloading firewall\n"
exit 100
fi
