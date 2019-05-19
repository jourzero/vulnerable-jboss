# Use Base Docker images for JBoss community projects with JDK from https://hub.docker.com/r/jboss/base-jdk
FROM jboss/base-jdk:7
USER	root

# locales
RUN		yum -y update
ENV		LANG en_US.utf8

# Get Jboss eap 5.1 
ENV		JBOSS_EAP_HOME /opt/jboss/eap-5.1
COPY	jboss-5.1.0.GA-jdk6.zip /opt/jboss/
RUN		unzip jboss-5.1.0.GA-jdk6.zip
RUN		mv /opt/jboss/jboss-5.1.0.GA /opt/jboss/eap-5.1
RUN		rm -rf /opt/jboss/jboss-5.1.0.GA-jdk6.zip

# Install other useful packages
RUN		yum install -y lsof vim wget

# jboss snapshot (jboss server configuration)
#COPY	files/myconf.tar.gz-part-* ${JBOSS_EAP_HOME}/jboss-as/server/
#RUN		cat ${JBOSS_EAP_HOME}/jboss-as/server/myconf.tar.gz-part-* > ${JBOSS_EAP_HOME}/jboss-as/server/myconf.tar.gz
#RUN		tar -zxvf ${JBOSS_EAP_HOME}/jboss-as/server/myconf.tar.gz -C ${JBOSS_EAP_HOME}/jboss-as/server/
#RUN		rm -rf ${JBOSS_EAP_HOME}/jboss-as/server/myconf.tar.gz*

# shell scripts
#COPY	files/jboss-eap	/usr/local/bin/
#RUN		chmod +x /usr/local/bin/jboss-eap

# launch JBoss using default profile
#ENTRYPOINT	["/usr/local/bin/jboss-eap", "default"]
EXPOSE 8080
#CMD ["/bin/bash"]
#COPY 	files/run.sh /opt/jboss/eap-5.1/bin/run.sh
CMD ["/opt/jboss/eap-5.1/bin/run.sh", "-b", "0.0.0.0"]
