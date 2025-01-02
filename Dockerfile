FROM openjdk:8-jdk-alpine AS builder

WORKDIR /app

COPY . .

RUN ./gradlew bootJar

FROM openjdk:8-jre-alpine

WORKDIR /app

COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

# comment for build
