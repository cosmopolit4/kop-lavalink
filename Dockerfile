FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Instalar wget
RUN apk add --no-cache wget

# Descargar Lavalink
RUN wget -O Lavalink.jar https://github.com/lavalink-devs/Lavalink/releases/download/4.0.7/Lavalink.jar

# Descargar el plugin lavasrc durante el build (no en runtime)
RUN mkdir -p plugins && \
    wget -O plugins/lavasrc-plugin-4.2.0.jar \
    https://github.com/topi314/LavaSrc/releases/download/4.2.0/lavasrc-plugin-4.2.0.jar

COPY application.yml .

EXPOSE 2333

CMD ["java", "-jar", "Lavalink.jar"]
