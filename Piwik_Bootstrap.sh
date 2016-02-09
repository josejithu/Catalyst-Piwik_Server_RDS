#!/bin/bash
#
#Scrpt to configure Piwik in a Custom Piwik AMI 

[ -f /bin/MySQL_DB_Hostname ] && DB_HOST=`cat /bin/MySQL_DB_Hostname` ||  sleep 120 ;
#Variables
PUBDNS=`curl http://169.254.169.254/latest/meta-data/public-hostname 2>/dev/null` ;
DB_HOST=`cat /bin/MySQL_DB_Hostname`;


# Copy the config files to right locations
cp -p /root/Piwik_Config_files/config.ini.php.REPLACE /var/www/html/piwik/config/config.ini.php;
cp -p /root/Piwik_Config_files/index.php.REPLACE /var/www/html/index.php;

sed -i "s/REPLACE_WITH_PUBDNS/$PUBDNS/g" /var/www/html/piwik/config/config.ini.php;
sed -i "s/REPLACE_WITH_DBHOST/$DB_HOST/g" /var/www/html/piwik/config/config.ini.php;

sed -i "s/REPLACE_WITH_PUBDNS/$PUBDNS/g" /var/www/html/index.php;
sed -i "s/REPLACE_WITH_DBHOST/$DB_HOST/g" /var/www/html/index.php;

# Set Permissions
chown -R www-data:www-data /var/www/html/;
chmod -R 0755 /var/www/html/piwik/tmp;

#Export MySQL DB
mysql -u piwikadmin -pp1w1kc0nn -h $DB_HOST piwikdb < /root/Piwik_Config_files/piwik_db_dump.sql

#Update MySQL Tables
mysql -u piwikadmin -pp1w1kc0nn -h $DB_HOST piwikdb -e "update piwik_site set name = '$PUBDNS';"
mysql -u piwikadmin -pp1w1kc0nn -h $DB_HOST piwikdb -e "update piwik_site set main_url = 'http://$PUBDNS';"
mysql -u piwikadmin -pp1w1kc0nn -h $DB_HOST piwikdb -e "update piwik_log_action set name  = '$PUBDNS/index.php'  where type =1;"
mysql -u piwikadmin -pp1w1kc0nn -h $DB_HOST piwikdb -e "update piwik_option set option_value = 'http://$PUBDNS/piwik' where option_name like '%piwikUrl%';"

#Restart Apache
service apache2 restart


exit 0;
