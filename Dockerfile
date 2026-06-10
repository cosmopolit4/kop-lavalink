FROM eclipse-temurin:17-jre

WORKDIR /app

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget -O Lavalink.jar https://github.com/lavalink-devs/Lavalink/releases/download/4.0.7/Lavalink.jar

RUN mkdir -p plugins && \
    wget -O plugins/lavasrc-plugin-4.2.0.jar \
    https://github.com/topi314/LavaSrc/releases/download/4.2.0/lavasrc-plugin-4.2.0.jar && \
    wget -O plugins/youtube-plugin-1.18.1.jar \
    https://github.com/lavalink-devs/youtube-source/releases/download/1.18.1/youtube-plugin-1.18.1.jar

COPY application.yml .

EXPOSE 2333

CMD ["java", "-jar", "Lavalink.jar"]
