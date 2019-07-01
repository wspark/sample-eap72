#FROM registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat7-openshift
FROM registry.access.redhat.com/jboss-eap-7/eap72-openshift
#FROM tomcat7-base:latest
    
USER root

COPY files/standalone-openshift.xml /opt/eap/standalone/configuration/

# Allow arbitrary
USER 185
  
EXPOSE 8080
   
