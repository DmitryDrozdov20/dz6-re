FROM tomcat:10-jdk16-openjdk
ENV BOXFUSE_WORK /usr/local/tomcat/boxfuse-sample-java-war-hello
RUN apt-get update && apt-get install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN apt-get install maven -y
WORKDIR $BOXFUSE_WORK
RUN mvn package
RUN cp $BOXFUSE_WORK/target/hello-1.0.war $CATALINA_HOME/webapps/
EXPOSE 8080
CMD ["usr/local/tomcat/bin/catalina.sh" ,"run"]
