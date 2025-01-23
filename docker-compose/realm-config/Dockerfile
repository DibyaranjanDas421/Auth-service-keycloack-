FROM quay.io/keycloak/keycloak:24.0.2

WORKDIR /opt/keycloak

# Copy the realm config files
COPY realm-config/ /opt/keycloak/data/import/

# Expose the port Keycloak will use
EXPOSE 8080

# Set environment variables for Keycloak admin
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin1234

# Start Keycloak with required arguments
CMD ["start-dev", "--import-realm", "--http-port=8080"]
