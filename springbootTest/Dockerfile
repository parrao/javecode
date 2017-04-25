FROM parrao/docker-jdk8 
MAINTAINER paratieshwara.rao@gmail.com

# Define working directory.
WORKDIR /opt

#copy the MainTest jar into the image
ADD  springbootTest-0.0.1-SNAPSHOT.jar /opt/springbootTest-0.0.1-SNAPSHOT.jar

#run the jar
CMD ["java", "-jar", "/opt/springbootTest-0.0.1-SNAPSHOT.jar"]

# Default http port
EXPOSE 8080

