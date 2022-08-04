FROM ubuntu:18.04
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN apt-get update
RUN apt-get install -y wget
RUN wget https://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.52/bin/apache-tomcat-9.0.52.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.52/* /opt/tomcat/.
RUN apt-get install -y openjdk-11-jdk
RUN java -version

WORKDIR /opt/tomcat/webapps
COPY sample.war /opt/tomcat/webapps
EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
