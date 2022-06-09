FROM 192.168.2.29:8443/proxy_cache/library/mysql:5.7.38
ADD my.cnf /etc/mysql/conf.d/my.cnf
COPY nacos.sql /docker-entrypoint-initdb.d/nacos.sql
EXPOSE 3306
