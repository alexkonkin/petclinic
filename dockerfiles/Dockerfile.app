FROM centos:7 as builder

WORKDIR /opt/petclinic

RUN yum install -y --nogpgcheck git which java-1.8.0-openjdk-devel &&\
    #if [ -d "/opt/petclinic" ]; then mkdir -pv /opt/petclinic; fi &&\
    git clone https://github.com/spring-projects/spring-petclinic . &&\
    ./mvnw package

FROM alpine:latest as application
WORKDIR /opt/petclinic
COPY --from=builder /opt/petclinic/target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar .
RUN apk --update add openjdk8-jre
CMD ["/usr/bin/java", "-jar","-Dspring.profiles.active=mysql","./spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar"]









