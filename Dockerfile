# Використання базового образу Alpine
ARG NGINX_VERSION=latest
FROM nginx:${NGINX_VERSION}

# Встановлення пакетів Nginx та supervisord
RUN apk update && \
    apk --no-cache add nginx supervisor

# Копіювання конфігураційних файлів в образ
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf

# Вказання команд, які будуть виконані при старті контейнера
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
