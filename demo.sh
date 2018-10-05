#!/bin/bash
#
#-------------------------------------------------------------------------#
# Auth: M. Heslin                                                         #
# Date: 2017-09-15                                                        #
# File: demo.sh                                                           #
# Desc: Deployment script for demonstrating how to deploy SQL Server 2017 #
#       on Red Hat Enterprise Linux 7.                                    #
#-------------------------------------------------------------------------#
#

clear
printf "\n\tDemonstration of how to install SQL Server 2017 on Red Hat Enterprise Linux.\n\n"

printf "\tThis demonstration shows how quickly and easily, SQL Server 2017 can be deployed\n"
printf "\tto a host running the no-cost developer edition of Red Hat Enterprise Linux 7.\n\n"

printf "$ cat /etc/redhat-release\n"
cat /etc/redhat-release
printf "\n\n\t Press any key to continue.\n"
read

printf "\tThe developer edition is a fully-functional version of Red Hat Enterprise Linux\n"
printf "\tintended for non-production use. For more information, or to download images:\n\n"
printf "\t\t https://developers.redhat.com/articles/faqs-no-cost-red-hat-enterprise-linux\n\n"
printf "\tTo save time the host has been previously updated ('yum update').\n"
printf "\n\n\t Press any key to continue.\n"
read 

TOTMEM=$(grep MemTotal /proc/meminfo | awk '{print $2}')
if [ $TOTMEM -lt 2200000 ] ; then
   clear
   echo "This system does not meet the minimum memory requirement."
   echo "SQL Server 2017 requires at least 2 GB of RAM. Aborting setup."
   exit 1
fi

clear
printf "\n\tThis demonstration consists of three parts:\n\n"
printf "\t\tInstallation of SQL Server 2017\n"
printf "\t\tInstallation of SQL Server Command Line Tools\n"
printf "\t\tSample Database Load and Query\n\n"
printf "\tThe total time required to complete these steps is approximately 5 minutes.\n\n"
printf "\tIMPORTANT: If you are running this script as a user and does not have sudo root\n"
printf "\tprivileges, ensure to set sudo privileges prior to moving on.\n"
printf "\tLet's get started!!!\n"
printf "\n\n\t Press any key to continue or ^C to interrupt.\n"
read

clear
printf "\n"
printf "**************************\n"
printf "*** Install SQL Server ***\n"
printf "**************************\n"

printf "\n1. Download the Microsoft SQL Server Red Hat repository configuration file\n\n"
printf "$ sudo curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server.repo"
printf "\n\n\t Press any key to continue.\n"
read
sudo curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server-2017.repo

printf "\n\n\t Press any key to continue.\n"
read
clear
printf "\n2. Install SQL Server 2017\n\n"
printf "$ sudo yum install -y mssql-server"
printf "\n\n\t Press any key to continue.\n"
read
sudo yum install -y mssql-server

printf "\n\n\t Press any key to continue.\n"
read
clear
printf "\n3. Run SQL Server Setup\n\n"
printf "$ sudo systemctl stop mssql-server"
printf "\n\n\t Press any key to continue.\n"
read
sudo systemctl stop mssql-server
printf "\n"
printf "$ sudo /opt/mssql/bin/mssql-conf setup"
printf "\n\n\t Press any key to continue.\n"
read
sudo /opt/mssql/bin/mssql-conf setup

printf "\n\n\t Press any key to continue.\n"
read
clear
printf "\n4. Verify SQL Server service is running\n\n"
printf "$ systemctl status mssql-server"
printf "\n\n\t Press any key to continue.\n"
read
systemctl status mssql-server

printf "\n\n\t Press any key to continue.\n"
read
clear
printf "\n5. Configure Firewall connections to allow remote access to port 1433/tcp\n\n"
printf "$ sudo firewall-cmd --zone=public --add-port=1433/tcp --permanent"
printf "\n\n\t Press any key to continue.\n"
read
sudo firewall-cmd --zone=public --add-port=1433/tcp --permanent
printf "\n"
printf "$ sudo firewall-cmd --reload" 
printf "\n\n\t Press any key to continue.\n"
read
sudo firewall-cmd --reload 

printf "\n"
printf "***************************************\n"
printf "*** Install of SQL Server Completed ***\n"
printf "***************************************\n"
printf "\n\n\t Press any key to continue.\n"
read
clear

printf "\n"
printf "*********************************************\n"
printf "*** Install SQL Server Command Line Tools ***\n"
printf "*********************************************\n"

printf "\n1. Download the Microsoft SQL Server Red Hat repository configuration file\n\n"
printf "$ sudo curl -o /etc/yum.repos.d/msprod.repo https://packages.microsoft.com/config/rhel/7/prod.repo"
printf "\n\n\t Press any key to continue.\n"
read
sudo curl -o /etc/yum.repos.d/msprod.repo https://packages.microsoft.com/config/rhel/7/prod.repo

printf "\n\n\t Press any key to continue.\n"
read
clear
printf "\n2. Remove any previous versions of mssql-tools\n\n"
printf "$ sudo yum remove unixODBC-utf16 unixODBC-utf16-devel"
printf "\n\n\t Press any key to continue.\n"
read
sudo yum remove unixODBC-utf16 unixODBC-utf16-devel

printf "\n\n\t Press any key to continue.\n"
read
clear
printf "\n3. Install mssql-tools and the unixODBC developer package\n\n"
printf "$ sudo yum install -y mssql-tools unixODBC-devel"
printf "\n\n\t Press any key to continue.\n"
read
sudo yum install -y mssql-tools unixODBC-devel

printf "\n\n\t Press any key to continue.\n"
read
clear
printf "\n4. Add /opt/mssql-tools/bin to your PATH\n\n"
printf "$ echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile"
printf "\n\n\t Press any key to continue.\n"
read
echo 'export PATH=$PATH:/opt/mssql-tools/bin' >> ~/.bash_profile

printf "\n"
printf "$ echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc"
printf "\n\n\t Press any key to continue.\n"
read
echo 'export PATH=$PATH:/opt/mssql-tools/bin' >> ~/.bashrc

printf "\n"
printf "$ source ~/.bashrc"
printf "\n\n\t Press any key to continue.\n"
read
source ~/.bashrc

printf "\n\n\t Press any key to continue.\n"
read
clear
printf "\n5. Connect locally to the SQL Server instance to verify database access\n\n"
printf "$ sqlcmd -S localhost -U SA -P <YourPasswordHere>"
printf "\n\n\t Press any key to continue.\n"
read
sqlcmd -S localhost -U SA -P RedHat123!

printf "\n"
printf "**********************************************************\n"
printf "*** Install of SQL Server Command Line Tools Completed ***\n"
printf "**********************************************************\n"
printf "\n\n\t Press any key to continue.\n"
read
clear

printf "\n"
printf "********************************\n"
printf "*** Create a Sample Database ***\n"
printf "********************************\n"

printf "\n1. Create a sample database and load data into it using Load_DB.sql\n\n"
printf "$ more Load_DB.sql"
printf "\n\n\t Press any key to continue.\n"
read
more Load_DB.sql
printf "\n"

printf "$ sqlcmd -U SA -P <YourPasswordHere> -i Load_DB.sql"
printf "\n\n\t Press any key to continue.\n"
read
sqlcmd -U SA -P RedHat123! -i Load_DB.sql

printf "\n"
printf "*** Creation of Sample Database Completed ***\n"
printf "\n\n\t Press any key to continue.\n"
read
clear

printf "\n2. Run queries against the sample database using Query_DB.sql\n\n"
printf "$ more Query_DB.sql"
printf "\n\n\t Press any key to continue.\n"
read
more Query_DB.sql
printf "\n"
printf "$ sqlcmd -U SA -P <YourPasswordHere> -i Query_DB.sql"
printf "\n\n\t Press any key to continue.\n"
read
sqlcmd -U SA -P RedHat123! -i Query_DB.sql

printf "\n"
printf "*** Queries on Sample Database Completed ***\n"
printf "\n\n\t Press any key to continue.\n"
read
printf "\n\tDemonstration SQL Server 2017 on Red Hat Enterprise Linux Complete\n\n"
