# Use Java 17 base image
FROM eclipse-temurin:17-jdk-alpine

# ✅ Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copy built jar
COPY target/secure-app-1.0-SNAPSHOT.jar app.jar

# Switch to non-root user
USER appuser

# ✅ Add HEALTHCHECK
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
  CMD java -jar app.jar --version || exit 1

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
