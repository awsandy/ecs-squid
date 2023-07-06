#!/bin/sh
set -x 
date > /tmp/setup.log
hostname >> /tmp/setup.log

yum -y install httpd php mysql php-mysqlnd

case $(ps -p 1 -o comm | tail -1) in
systemd) systemctl enable --now httpd ;;
init) chkconfig httpd on; service httpd start ;;
*) echo "Error starting httpd (OS not using init or systemd)." 2>&1
esac

if [ ! -f /var/www/html/bootcamp-app.tar.gz ]; then
cd /var/www/html
wget https://s3.amazonaws.com/immersionday-labs/bootcamp-app.tar
tar xvf bootcamp-app.tar
chown apache:root /var/www/html/rds.conf.php
fi
yum -y update
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm || true
cd /var/www/html
cp index.php index.php.orig
i=`curl http://169.254.169.254/latest/meta-data/instance-id`
j=`echo $i | tail -c 7`
of=`printf "<body style=\"background-color:#%s\">" $j`
sed 's/<body>/<body style="background-color:#e42abb">/' index.php.orig > index.php
