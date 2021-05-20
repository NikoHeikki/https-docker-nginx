FROM nginx

RUN apt-get update -y

COPY CA-signes.conf /etc/nginx/snippets/CA-signes.conf

COPY ssl-params.conf /etc/nginx/snippets/ssl-params.conf

COPY server.crt /etc/ssl/certs/server.crt
COPY server.key /etc/ssl/private/server.key

COPY app.conf /etc/nginx/conf.d/app.conf

RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048





