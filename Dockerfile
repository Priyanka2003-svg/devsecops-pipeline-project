
FROM eclipse-temurin:17-jdk-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app


COPY target/secure-app-1.0-SNAPSHOT.jar app.jar


USER appuser


HEALTHCHECK --interval=30s --timeout=5s --start-period=10s \
  CMD java -jar app.jar --version || exit 1


ENTRYPOINT ["java", "-jar", "app.jar"]
