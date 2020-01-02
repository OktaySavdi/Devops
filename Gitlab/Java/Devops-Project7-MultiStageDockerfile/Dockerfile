# Step : Test and package
FROM maven:3.6.3-jdk-8 as jdk
WORKDIR /build
COPY . . 
RUN mvn package

FROM websphere-liberty:latest
COPY --from=jdk /build/webapp/target/webapp.war /config/dropins/
COPY --from=jdk /build/server.xml /config/
ENV LICENSE accept