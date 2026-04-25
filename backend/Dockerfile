FROM maven:3.9.9-eclipse-temurin-21

WORKDIR /app

COPY . .

RUN mvn clean install -Dmaven.test.skip=true

EXPOSE 5000

CMD ["java", "-jar", "target/*.jar"]