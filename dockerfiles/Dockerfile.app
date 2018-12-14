FROM centos:7 as builder

WORKDIR /opt/petclinic

RUN yum install -y --nogpgcheck git which java-1.8.0-openjdk-devel &&\
    git clone https://github.com/spring-projects/spring-petclinic . &&\
    pwd && ls -la &&\
    sed -i 's/localhost/db/g' ./src/main/resources/application-mysql.properties &&\
    ./mvnw package

FROM alpine:latest as application
WORKDIR /opt/petclinic
COPY --from=builder /opt/petclinic/target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar .
RUN apk --update add openjdk8-jre
CMD ["/usr/bin/java", "-jar","-Dspring.profiles.active=mysql","./spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar"]









