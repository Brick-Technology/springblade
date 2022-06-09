FROM 192.168.2.29:8443/proxy_cache/anapsix/alpine-java:8_server-jre_unlimited



RUN mkdir -p /blade/system

WORKDIR /blade/system

EXPOSE 8106

ADD ./target/blade-system.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
