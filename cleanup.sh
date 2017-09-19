#!/bin/bash

printf "***************************************\n"
printf "*** Cleanup SQL Server Installation ***\n"
printf "***************************************\n"
read


printf "\n1. Drop Database Sample Table\n\n"
printf "$ sqlcmd -U SA -P RedHat123!  -i Query_DB.sql\n"
sqlcmd -U SA -P RedHat123!  -i Drop_DB.sql

printf "\n2. Remove SQL Server 2017\n\n"
printf "$ sudo yum erase -y mssql-server\n"
sudo systemctl stop mssql-server
sudo yum erase -y mssql-server

printf "\n3. Remove mssql-tools and the unixODBC developer package\n\n"
printf "$ sudo yum erase -y mssql-tools unixODBC-devel\n"
sudo yum erase -y mssql-tools unixODBC-devel

printf "\n4. Remove the Microsoft SQL Server Red Hat repository configuration files\n\n"
printf "$ sudo rm /etc/yum.repos.d/mssql-server.repo\n" 
sudo rm /etc/yum.repos.d/mssql-server.repo 
printf "$ sudo rm /etc/yum.repos.d/msprod.repo\n" 
sudo rm /etc/yum.repos.d/msprod.repo

printf "\n5. Restore Firewall connections - remove access to port 1433/tcp\n\n"
printf "$ sudo firewall-cmd --zone=public --remove-port=1433/tcp --permanent\n"
sudo firewall-cmd --zone=public --remove-port=1433/tcp --permanent
printf "$ sudo firewall-cmd --reload\n" 
sudo firewall-cmd --reload 

printf "\n6. Restore $PATH in ~/.bashrc, ~/.bash_profile\n\n"
cp -p ~mheslin/.bashrc.orig ~mheslin/.bashrc
cp -p ~mheslin/.bash_profile.orig ~mheslin/.bash_profile
source ~mheslin/.bashrc

printf "\n"
printf "***************************************\n"
printf "*** Removal of SQL Server Completed ***\n"
printf "***************************************\n"


