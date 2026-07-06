# Paso 1: Compilar la aplicación con Maven y Java 8
FROM maven:3.8.8-openjdk-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Paso 2: Correr la aplicación en un servidor Tomcat nativo
FROM tomcat:9.0-jdk8-openjdk-slim
WORKDIR /usr/local/tomcat

# Copiar el archivo .war generado a la carpeta webapps de Tomcat
COPY --from=build /app/target/*.war ./webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
