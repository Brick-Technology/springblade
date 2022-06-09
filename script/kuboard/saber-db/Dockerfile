FROM 192.168.2.29:8443/proxy_cache/library/mysql:8.0.29
ADD my.cnf /etc/mysql/conf.d/my.cnf
COPY blade-saber-mysql.sql /docker-entrypoint-initdb.d/blade-saber-mysql.sql
# COPY blade-sword-mysql.sql /docker-entrypoint-initdb.d/blade-sword-mysql.sql
# COPY seata_order.sql /docker-entrypoint-initdb.d/seata_order.sql
# COPY seata_storage.sql /docker-entrypoint-initdb.d/seata_storage.sql
# COPY seata.sql /docker-entrypoint-initdb.d/seata.sql
EXPOSE 3306
