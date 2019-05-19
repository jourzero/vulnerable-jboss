# Use Base Docker images for JBoss community projects with JDK from https://hub.docker.com/r/jboss/base-jdk
FROM jboss/base-jdk:7
USER root

# Prepare OS
RUN  yum -y update
RUN  yum install -y lsof vim wget

# Setup Jboss eap 5.1 
ENV  LANG en_US.utf8
ENV  JBOSS_EAP_HOME /opt/jboss/eap-5.1
COPY jboss-5.1.0.GA-jdk6.zip /opt/jboss/
RUN  unzip jboss-5.1.0.GA-jdk6.zip
RUN  rm -rf /opt/jboss/jboss-5.1.0.GA-jdk6.zip

# Start JBoss
EXPOSE 8080
CMD ["/opt/jboss/jboss-5.1.0.GA/bin/run.sh", "-b", "0.0.0.0"]
