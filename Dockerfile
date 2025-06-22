# Temel imaj: Java 17 ile minimal
FROM openjdk:17-jdk-slim

# Uygulama jar'ını container içine kopyala
COPY target/myapp-1.0.0.jar app.jar

# Uygulamayı başlat
ENTRYPOINT ["java", "-jar", "app.jar"]

