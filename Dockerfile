FROM openjdk:11-jre-slim

WORKDIR /usr/src/app

COPY HelloWorld.class .

CMD ["java", "HelloWorld"]
