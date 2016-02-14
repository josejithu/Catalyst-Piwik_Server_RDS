#
# INSTRUCTIONS:
#
# 1.Clone The git repo : https://github.com/josejithu/Catalyst-Piwik_Server_RDS or download the ZIP file
#
# 2. Else,Download the templates from s3 location : 
#     a. https://s3-ap-southeast-2.amazonaws.com/piwik-jithu/Piwik-Conf-Files/Piwik_RDS-CustomAMI.template
#     b. https://s3-ap-southeast-2.amazonaws.com/piwik-jithu/Piwik-Conf-Files/Piwik_RDS-Install.template
#
# 3. Run template from AWS CloudFormation console. Currently the template run will work only on ap-southeast-2 (Sydney) and us-east-1    ( N.Virginia) regions.
	You need to provide an existing private key
#
# 4. The template will download all the necessary packages/files for the installation and configure Piwik Application. 
#
# 5. Piwik SignIn UserName: piwikadmin
#                Password : p1w1kc0nn
#
# 6. The Piwik Dashboard will reflect the newly created instance's Public DNS as Website name.
#
# 7. The PHP website (sample) can be loaded using http://<PUBLIC DNS NAME>/index.php
#
# 8. Visitors in Real Time can be viewed from Piwik Dashboard and by adjusing the date.
