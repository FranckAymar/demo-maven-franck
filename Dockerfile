FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package
#CMD java $JAVA_OPTS -jar target/dependency/webapp-#runner.jar --port $PORT target/*.war
