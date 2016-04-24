#!/bin/bash

curl -LOk http://download.forge.ow2.org/spagobi/mysql-dbscripts-5.2.0_24032016.zip

yum install -y unzip

unzip mysql-dbscripts-5.2.0_24032016.zip

mysql --user="root" --database="spagobi" --password="password" < mysql/MySQL_create.sql
mysql --user="root" --database="spagobi" --password="password" < mysql/MySQL_create_quartz_schema.sql
