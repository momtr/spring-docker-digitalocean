#
#   B U I L D    S T A G E
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package -Dmaven.test.skip=true

#
#   P A C K A G E    S T A G E
#
FROM openjdk:8-jdk-alpine
COPY --from=build /home/app/target/q-api-0.0.1-SNAPSHOT.jar /usr/local/lib/app.jar
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]