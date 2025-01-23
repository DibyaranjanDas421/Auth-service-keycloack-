FROM quay.io/keycloak/keycloak:24.0.2

# Set the working directory
WORKDIR /opt/keycloak

# Copy the realm config files
COPY realm-config/ /opt/keycloak/data/import/

# Expose the port that Keycloak will use
EXPOSE 8080

# Set environment variables for Keycloak admin and production mode
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin1234
ENV KEYCLOAK_HTTP_PORT=8080
ENV QUARKUS_PROFILE=prod

# If Keycloak is behind a reverse proxy, uncomment the following line:
# ENV KEYCLOAK_HTTP_PROXY=edge

# Start Keycloak with the appropriate command for production mode
CMD ["start", "--import-realm", "--http-port=8080"]

# Health check to ensure Keycloak is running
HEALTHCHECK --interval=30s --timeout=30s --retries=3 \
  CMD curl --silent --fail http://localhost:8080/health/live || exit 1
