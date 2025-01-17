# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:24.0.2

# Set environment variables for admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin1234

# Copy the realm configuration file
COPY api-gateway-auth-realm.json /opt/keycloak/data/import/

# Expose the necessary port (Render automatically assigns ports)
EXPOSE 9191

# Run Keycloak in development mode with realm import
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--import-realm", "--http-port=9191"]
