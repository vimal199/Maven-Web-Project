FROM openjdk:8
EXPOSE 8080
ADD target/tushar.war tushar.war
ENTRYPOINT ["java", "-jar", "tushar.war"]
