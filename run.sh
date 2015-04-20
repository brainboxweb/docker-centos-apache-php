#!/bin/bash
chown www-data:www-data /app -R
#source /etc/httpd/envvars
tail -F /var/log/httpd/* &
exec httpd -D FOREGROUND
