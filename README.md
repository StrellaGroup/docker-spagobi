# SpagoBI 5.2 on Tomcat 7 with MySQL

This is SpaboBI 5.2 running in Tomcat7 with configs updated for MySQL.

Included SpagoBI engines:

 - SpagoBIBirtReportEngine
 - SpagoBIConsoleEngine
 - SpagoBIMobileEngine

### Usage:

```bash
# Start MySQL container.
docker run --name mysql -e MYSQL_ROOT_PASSWORD=<DB_PASS> \
    -e MYSQL_DATABASE=<DB_NAME> -d \
    -v $CURRENT_DIR/db:/db mysql/mysql-server:5.6

# Install SpagoBI DB scripts.
docker exec -it mysql bash /db/setup.sh

# Start SpagoBI container.
docker run -id --name spagobi -p 8080:8080 --link mysql:db \
    -e JAVA_OPTS="-Dcatalina.db.pass=<DB_PASS> -Dcatalina.db.username=root -Dcatalina.db.url=jdbc:mysql://<DB_NAME>/spagobi" spagobi
```

Or run `bash run.sh`.

The database image is from [mysql/mysql-docker](https://github.com/mysql/mysql-docker), so you might want to take a look at that if you want to tweak the MySQL user and password. The commands above assume the default user `root` is being used.

`run.sh` has defaults that you might want to change before running.
