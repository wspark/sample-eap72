#FROM registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat7-openshift
FROM registry.access.redhat.com/jboss-eap-7/eap72-openshift
#FROM tomcat7-base:latest
    
USER root
RUN mkdir -p /logs/was /logs/app

COPY files/standalone-openshift.xml /opt/eap/standalone/configuration/

RUN chmod -R 775 /logs /app \
   && chown 185:root /logs /app -R
# Allow arbitrary
USER 185
  
EXPOSE 8080
   
