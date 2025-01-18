# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:24.0.2

# Set environment variables for admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin1234

# Optimize memory usage to prevent crashes on Render
ENV JAVA_OPTS="-XX:MaxRAMPercentage=75.0"

# Set the dynamic port that Render assigns
ENV KEYCLOAK_HTTP_PORT=${PORT:-8080}

# Copy the realm configuration file
COPY api-gateway-auth-realm.json /opt/keycloak/data/import/

# Expose Render's dynamic port (Render assigns a port automatically)
EXPOSE 8080

# Start Keycloak in normal mode (not development mode) with realm import
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--import-realm"]
