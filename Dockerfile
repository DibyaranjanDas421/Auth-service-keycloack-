FROM quay.io/keycloak/keycloak:24.0.2

WORKDIR /opt/keycloak

# Ensure the folder exists before copying
RUN mkdir -p /opt/keycloak/data/import

EXPOSE 8080

# Copy the realm-config directory
COPY realm-config/api-gateway-auth-realm.json /opt/keycloak/data/import/api-gateway-auth-realm.json

# Set Keycloak to import the realm file
ENV KEYCLOAK_IMPORT=/opt/keycloak/data/import/api-gateway-auth-realm.json

# Set Java options
ENV JAVA_OPTS="-Xms256m -Xmx512m"

# Use CMD without specifying 'kc.sh' directly
CMD ["start-dev", "--import-realm", "--http-port=${PORT}", "--health-enabled=true"]
