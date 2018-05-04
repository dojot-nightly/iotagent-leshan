FROM zenika/alpine-maven:3-jdk8

RUN mkdir -p /usr/src/app/data

ADD pom.xml /usr/src/app/pom.xml
WORKDIR /usr/src/app
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

ADD Californium.properties /usr/src/app/Californium.properties
ADD src /usr/src/app/src
RUN ["mvn", "package"]

CMD ["java", "-jar", "target/iotagent-leshan-1.0-SNAPSHOT-jar-with-dependencies.jar"]
