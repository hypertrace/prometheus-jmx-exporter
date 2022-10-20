FROM eclipse-temurin:11-jre-alpine

ENV JMX_EXPORTER_VERSION=0.17.2

RUN mkdir -p /opt/jmx_prometheus_httpserver/config && \
    wget -q -O /opt/jmx_prometheus_httpserver/jmx_prometheus_httpserver.jar https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_httpserver/${JMX_EXPORTER_VERSION}/jmx_prometheus_httpserver-${JMX_EXPORTER_VERSION}.jar

COPY collect-all.yml /opt/jmx_prometheus_httpserver/config/collect-all.yml

WORKDIR /opt/jmx_prometheus_httpserver

ENTRYPOINT ["java", "-jar", "jmx_prometheus_httpserver.jar"]

CMD ["5556", "config/collect-all.yml"]
