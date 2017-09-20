 # SQL-Server - RHEL-BM-Demo
Scripted demo of how to install, configure SQL Server on RHEL Bare Metal

Demo consists of three stages:
   1. Installation of SQL Server 2017
   2. Installation of SQL Server Command Line Tools
   3. Sample Database Load and Query

The total time required to complete these steps is approximately 5 minutes.

Prerequisites
  - Bare metal or VM host running Red Hat Enterprise Linux 7.4 with latest updates.
    The developer edition of RHEL can be used for non-production purposes and was used 
    to create this demo. For more information, or to download images:
    
      https://developers.redhat.com/articles/faqs-no-cost-red-hat-enterprise-linux

Included Files
   1. demo.sh              /* simple bash script to walk-through installation steps
   2. Load_DB.sql          /* SQL script to create, load a sample SQL database
   3. Query_DB.sh          /* SQL script to run three queries against SQL database
   4. Drop_DB.sh           /* SQL script to delete SQL database
   5. cleanup.sh           /* simple bash script to remove SQL database, tools, restore firewall, etc.
  
Installing the Demo
   1. Create a directory on the demo host - e.g. mkdir -p ~demo-user/sql-demo
   2. Download the demo scripts to the demo host/directory
   3. Ensure execute permissions are set for all demo scripts - e.g. chmod +x
  
Running the Demo

   $ cd ~demo-user
   $ ./demo.sh
   
Removing the Demo

   $ cd ~demo-user
   $ ./cleanup.sh

