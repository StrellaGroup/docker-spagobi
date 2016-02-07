# SpagoBI 5.1 on Tomcat 7 with postgres
##Status: Works, but requires manual DB setup

This is SpaboBi 5.1 running in Tomcat7 with configs updated for PostgreSQL DB

Uncluded SpagoBI engines:

 - SpagoBIBirtReportEngine
 - SpagoBIConsoleEngine
 - SpagoBIMobileEngine

###Postgres
Il personnaly use a postgres containeR.
This doc details how to launch spagobi with a postgres container
DB need to be created manually

Start a postgres container

    docker run --name postgres -d -p 5432:5432 -p 2223:22 guilhem30/postgresql
    
Create spagobi user and db

    createuser --no-createrole --no-superuser --pwprompt spagobi
    createdb -O spagobi spagobi

Get postgres script from your version

    wget http://download.forge.ow2.org/spagobi/postgres-dbscript-5.1.0_19012015.zip

Extract files and populate DB
    
    psql -U spagobi -h localhost spagobi < PG_create.sql
    psql -U spagobi -h localhost spagobi < PG_create_quartz_schema.sql

###To start use:

    docker run -d --name <spagobi container> -p 8080:8080 --link <POSGRES container>: db -e JAVA_OPTS="-Dcatalina.db.pass=<DB PASS> -Dcatalina.db.username=<DB USER> -Dcatalina.db.url=jdbc:postgresql://db:5432/<DB NAME>" bretif/spagobi

Please change **PASS, USER, IP, DATABASE** of your postgres database with installed SpagoBi schema!

Example:

 - psql SpagoBI < PG_create.sql
 - psql SpagoBI < PG_create_quartz_schema.sql

TODO: Compile SpagobiFilter.jar on build AND DB setup
