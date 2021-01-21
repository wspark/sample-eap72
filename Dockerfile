FROM registry.redhat.io/jboss-eap-7/eap72-openshift
    
USER root
RUN mkdir -p /logs /app /test

ENV DISABLE_EMBEDDED_JMS_BROKER=true


COPY files/standalone-openshift.xml /opt/eap/standalone/configuration/
COPY files/standalone.conf /opt/eap/bin/
COPY files/modules /opt/eap/modules
ADD files/simple.war /opt/eap/standalone/deployment/

RUN chown 185:root /logs /app /opt/eap/modules -R
RUN chmod 777 /logs /app /opt/eap/modules -R

# Allow arbitrary
USER 185
  
EXPOSE 8080
