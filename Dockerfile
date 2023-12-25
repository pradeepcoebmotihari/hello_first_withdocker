# Pull base image 
From tomcat:8-jre8
EXPOSE 8080

# Maintainer 
MAINTAINER "pradeeprdfdffsdgsdanjan" 
COPY webapp/target/webapp.war /usr/local/tomcat/webapps

