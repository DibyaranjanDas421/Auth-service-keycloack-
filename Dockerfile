FROM quay.io/keycloak/keycloak:24.0.2

WORKDIR /opt/keycloak

COPY realm-config /opt/keycloak/data/import

ENV JAVA_OPTS="-Xms256m -Xmx512m"

CMD ["start-dev", "--import-realm", "--http-port=9191"]
