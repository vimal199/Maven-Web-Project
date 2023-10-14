# Use an official Tomcat runtime as the base image
FROM tomcat:latest

# Remove the default ROOT web application that comes with Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file into the webapps directory of the Tomcat container
COPY  target/tushar.war /usr/local/tomcat/webapps/tushar.war

# Expose the default HTTP port for the Tomcat server
EXPOSE 8080

# Start Tomcat when the container launches
CMD ["catalina.sh", "run"]
