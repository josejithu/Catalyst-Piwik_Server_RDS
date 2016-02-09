# Catalyst-Piwik_Server_RDS
Automated Build of Piwik Analytics Application with AWS CloudFormation

AWS CloudFormation templates for Deploying a Piwik analytics application (www.piwik.org) to a dedicated AWS Stack. The templates automates build of the application server on an Ubuntu LTS AMI and creation of MySQL RDS instance for data storage of the piwik application,and the configuration of Piwik to use the DB

2 templates provided here:

1.** Piwik_RDS-Install.template** - CloudFormation template that deploys a Piwik Application on Ubuntu Server 14.04 LTS and MySQL RDS as DB. ( currently restricted to ap-southest-2 and us-east-1 regions )

2.** Piwik_RDS-CustomAMI.template** - Uses a custom AMI pre-installed with Piwik Application and Bootstrap scripts to configure Piwik and boot time. The script ( Piwik_Bootstrap.sh ) is run at boot time as a cron job, and it configures the Piwik Application and backend RDS, according to the hostname of the instance and RDS. ( currently restricted to ap-southest-2 and us-east-1 regions )
