### docker
#### mariadb + phpmyadmin
    $ docker run --name some-mariadb --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mariadb:latest
    $ docker run --name some-phpmyadmin -e UPLOAD_LIMIT=9999M --restart=always -d --link some-mariadb:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin

#### redis + rediscommander (search for ip like 172.17.0.3)
    $ docker run --name some-redis --restart=always -p 6379:6379 -d redis:latest
    $ docker inspect some-redis
    $ docker run --name some-rediscommander --platform linux/x86_64 -p 8081:8081 -e REDIS_HOSTS=local:172.17.0.3:6379 --restart always -d rediscommander/redis-commander:latest

#### mongodb
    $ docker run -d  --name some-mongo --restart=always -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=root mongo

#### mysql + phpmyadmin
    $ docker run --name some-mysql --platform linux/x86_64 --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7
    $ docker run --name some-phpmyadmin -e UPLOAD_LIMIT=9999M --restart=always -d --link some-mysql:db -e MYSQL_ROOT_PASSWORD=root -p 8080:80 phpmyadmin
    
#### mssql (if you really need it)
    $ docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=root" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2022-latest

#### openstreetmap germany
    $ docker run -it --name openstreetmap_germany --restart=always --memory=20g --shm-size=2g -e PBF_URL=https://download.geofabrik.de/europe/germany-latest.osm.pbf -e REPLICATION_URL=https://download.geofabrik.de/europe/germany-updates/ -e IMPORT_WIKIPEDIA=false -e NOMINATIM_PASSWORD=this_is_a_password -v nominatim-data:/nominatim -v nominatim-data-sql:/var/lib/postgresql/14/main -p 3001:8080 --name nominatim mediagis/nominatim:4.2

### dev
    $ docker run --name some-mysql --platform linux/x86_64 --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7
    $ docker run --name some-redis --restart=always -p 6379:6379 -d redis:5.0.6
