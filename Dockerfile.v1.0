FROM docker.io/nginx:1.17.0-alpine
EXPOSE 80
VOLUME ["/etc/nginx/conf.d","/etc/nginx/certs"]
COPY index.html.v1.0 /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]
