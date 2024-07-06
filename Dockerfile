FROM maven:3.8.1-openjdk-8 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM openjdk:8-jre-slim
WORKDIR /app
COPY --from=build /app/target/mi-app-docker-1.0.0.jar mi-app-docker.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "mi-app-docker.jar"]
