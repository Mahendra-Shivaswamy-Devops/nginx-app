FROM nginx:latest
COPY ./static/ /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
