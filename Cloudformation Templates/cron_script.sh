#!/bin/bash
crontab -r | { cat; echo '*/15 * * * * /home/ec2-user/checker_script.sh';echo '0 18 * * * /etc/init.d/httpd restart';echo '*/15 * * * * /usr/sbin/logrotate -f /etc/logrotate.d/';echo '*/5 * * * * ~/.aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --disk-space-util --disk-path=/ --from-cron';echo '* * * * * php /var/www/phplaravel/artisan schedule:run >> /dev/null 2>&1'; } | crontab -