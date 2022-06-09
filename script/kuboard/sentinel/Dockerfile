FROM 192.168.2.29:8443/proxy_cache/adoptopenjdk/openjdk8:jre8u332-b09-alpine
WORKDIR /home/sentinel
ENV VERSION=1.8.2
ENV csp_sentinel_dashboard_server=localhost:8858
ENV project_name=sentinel-dashboard
LABEL release=${VERSION}
COPY sentinel-dashboard.jar /home/sentinel/sentinel-dashboard.jar
CMD java -Dcsp.sentinel.dashboard.server=$csp_sentinel_dashboard_server -Dproject.name=$project_name -jar sentinel-dashboard.jar
