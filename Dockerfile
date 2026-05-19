# syntax=docker/dockerfile:1.7

# ---------- Stage 1: build with Maven ----------
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /workspace

# Cache dependencies first for faster rebuilds
COPY pom.xml ./
RUN mvn -B -q dependency:go-offline

# Now copy sources and build
COPY src ./src
RUN mvn -B -q clean package -DskipTests=false

# ---------- Stage 2: minimal runtime image ----------
FROM eclipse-temurin:17-jre-alpine AS runtime

ENV APP_HOME=/app \
    JAVA_OPTS=""

WORKDIR ${APP_HOME}

# Run as a non-root user
RUN addgroup -S app && adduser -S app -G app

COPY --from=build /workspace/target/hello-world.jar ${APP_HOME}/app.jar

USER app

ENTRYPOINT ["sh", "-c", "exec java $JAVA_OPTS -jar /app/app.jar \"$@\"", "--"]
