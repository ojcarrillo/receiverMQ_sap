
FROM openjdk:8-jdk-alpine
ADD target/sandbox-sap-receiverMQ.jar app.jar
ENTRYPOINT java -jar app.jar
