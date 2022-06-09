FROM 192.168.2.29:8443/proxy_cache/anapsix/alpine-java:8_server-jre_unlimited



RUN mkdir -p /blade/swagger

WORKDIR /blade/swagger

EXPOSE 18000

ADD ./target/blade-swagger.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
