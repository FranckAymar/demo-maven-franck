FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM tomcat
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/*.war $CATALINA_HOME/webapps/
CMD ["sed -i -e \"s/8080/$PORT/\" /usr/local/tomcat/conf/server.xml","catalina.sh", "run"]


