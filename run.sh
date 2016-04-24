#!/bin/bash

CURRENT_DIR=`pwd`

# Start MySQL container.
docker run --name mysql -e MYSQL_ROOT_PASSWORD=password \
    -e MYSQL_DATABASE=spagobi -d \
    -v $CURRENT_DIR/db:/db mysql/mysql-server:5.6

# Install SpagoBI DB scripts.
docker exec -it mysql bash /db/setup.sh

# Start SpagoBI container.
docker run -id --name spagobi -p 8080:8080 --link mysql:db \
    -e JAVA_OPTS="-Dcatalina.db.pass=password -Dcatalina.db.username=root -Dcatalina.db.url=jdbc:mysql://db/spagobi" spagobi
