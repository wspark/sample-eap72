FROM registry.redhat.io/jboss-eap-7/eap72-openshift
    
USER root
RUN mkdir /logs /app /test

COPY files/standalone-openshift.xml /opt/eap/standalone/configuration/
COPY files/modules /opt/eap/modules

RUN chmod 777 /logs /app /opt/eap/modules 
RUN chown 185:root /logs /app 

# Allow arbitrary
USER 185
  
EXPOSE 8080
   
