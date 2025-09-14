FROM nginx:stable

RUN apt update && apt install -y curl

COPY default.conf /etc/nginx/conf.d/default.conf

CMD ["sh", "-c", "until getent hosts tp3_httpd1 && getent hosts tp3_httpd2; do sleep 1; done && nginx -g 'daemon off;'"]
