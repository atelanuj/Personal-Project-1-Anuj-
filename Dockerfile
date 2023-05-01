#Dockerfile

FROM openjdk:8
EXPOSE 8080
ADD target/devops-integration.jar devops-integration.jar   #you can also use COPY target/devops-integration.jar /devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]
