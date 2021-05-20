# https-docker-nginx

Docker Nginx container with https turned after inserting certs

## Sertificates

### Create self-signes certificates using OpenSSL (Good for local deveploment)
This will create certificate and key
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt
```
### Get certificate from Let’s Encrypt(https://letsencrypt.org/) using Certbot(https://certbot.eff.org/)
Install Cerbot and install certs by following instructions and you should end up with certificate file and key. Requires to open port 80 for Let’s Encrypt to verify the domain name.

## Clone this repository
```
git clone https://github.com/NikoHeikki/https-docker-nginx.git
```
## Modify app.conf
Change all example.org url's to the name of your server, change SSLCertificateFile and SSLCertificateKeyFile to point out created files.

## Modify Dockerfile
Change COPY command to point to certificate and key name, for Cerbot certificate this is usually fullchain.pem and privkey.pem

## Build Docker image
```
docker build -t nginx-cert:latest .
```

## Run docker container from Apache foreground
```
docker run -d -p 80:80 -p 443:443 nginx-cert:latest
```

## Check localhost for https
Chrome warns for https not secure if you are using self-signed certificate instead of CA certificate but self-signed is still secure but its not validated.

