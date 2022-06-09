FROM 192.168.2.29:8443/proxy_cache/anapsix/alpine-java:8_server-jre_unlimited



RUN mkdir -p /blade/develop

WORKDIR /blade/develop

EXPOSE 7007

ADD ./target/blade-develop.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
