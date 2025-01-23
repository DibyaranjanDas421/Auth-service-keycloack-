FROM quay.io/keycloak/keycloak:24.0.2

WORKDIR /opt/keycloak

# Copy the realm config files (adjust the path if necessary)
COPY realm-config/ /opt/keycloak/data/import/

# Expose the port Keycloak will use
EXPOSE 8080

# Set environment variables for Keycloak admin and port
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin1234
ENV HTTP_PORT=8080

# Start Keycloak with required arguments
CMD ["start-dev", "--import-realm", "--http-port=8080"]
