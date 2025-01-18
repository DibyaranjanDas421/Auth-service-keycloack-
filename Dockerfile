# # Use the official Keycloak image
# FROM quay.io/keycloak/keycloak:24.0.2

# # Set environment variables for admin credentials
# ENV KEYCLOAK_ADMIN=admin
# ENV KEYCLOAK_ADMIN_PASSWORD=admin1234

# # Optimize memory usage to prevent crashes on Render
# ENV JAVA_OPTS="-XX:MaxRAMPercentage=75.0"

# # Set the port dynamically based on Render's PORT environment variable
# ENV QUARKUS_HTTP_PORT=${PORT:-8080}

# # Copy the realm configuration file
# COPY api-gateway-auth-realm.json /opt/keycloak/data/import/

# # Expose the dynamic port (Render assigns a port automatically)
# EXPOSE 8080

# # Start Keycloak in normal mode (not development mode) with realm import
# ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--import-realm"]

# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:24.0.2

# Set environment variables for admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin1234

# Optimize memory usage to prevent crashes on Render
ENV JAVA_OPTS="-XX:MaxRAMPercentage=75.0"

# Set hostname explicitly for Keycloak to prevent resolution errors
ENV KC_HOSTNAME=auth-service-keycloack.onrender.com

# Set the HTTP port (Render will automatically assign a port, but you can set the default port here)
ENV KEYCLOAK_HTTP_PORT=8080

# Set realm import location
ENV KEYCLOAK_IMPORT=/opt/keycloak/data/import/api-gateway-auth-realm.json

# Copy the realm configuration file
COPY api-gateway-auth-realm.json /opt/keycloak/data/import/

# Expose Render's dynamic port (Render assigns a port automatically)
EXPOSE 8080

# Start Keycloak in normal mode with realm import
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--import-realm", "--http-port", "8080"]

