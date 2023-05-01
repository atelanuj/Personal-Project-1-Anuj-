#Dockerfile
#base image
FROM openjdk:8
#open the 8080 port for Container
EXPOSE 8080
#you can also use COPY target/devops-integration.jar /devops-integration.jar
ADD target/devops-integration.jar devops-integration.jar   
#run thr application inside the container
ENTRYPOINT ["java","-jar","/devops-integration.jar"]
