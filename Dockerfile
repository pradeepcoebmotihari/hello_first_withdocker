# Pull base image 
From tomcat:8-jre8
EXPOSE 8080

# Maintainer 
MAINTAINER "valaxytecccch@gmail.com" 
COPY webapp/target/webapp.war /usr/local/tomcat/webapps

