FROM gradle:jdk11 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon


FROM openjdk:11-jre
EXPOSE 1080

RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/*.jar /app/netty-socks5.jar
ENTRYPOINT ["java", "-jar","/app/netty-socks5.jar"]