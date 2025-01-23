FROM quay.io/keycloak/keycloak:24.0.2

WORKDIR /opt/keycloak

# Copy the realm config files (adjust the path if necessary)
COPY realm-config/ /opt/keycloak/data/import/

# Expose the port Keycloak will use
EXPOSE 8080

# Set environment variables for Keycloak admin
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin1234
ENV HTTP_PORT=${PORT}  # Railway assigns dynamic port

# Start Keycloak with required arguments
CMD ["/opt/keycloak/bin/kc.sh", "start-dev", "--import-realm", "--http-port=${PORT}"]
