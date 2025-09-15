FROM nginx:alpine

RUN apk add --no-cache curl

COPY ./default.conf /etc/nginx/conf.d/default.conf

# Attends que les noms des serveurs Apache soient visibles, puis lance Nginx en mode non‑daemon
CMD ["sh", "-c", "until getent hosts tp3_httpd1 && getent hosts tp3_httpd2; do sleep 1; done && nginx -g 'daemon off;'"]
