FROM nginx:alpine

COPY proxy.conf /etc/nginx/proxy.conf

COPY hub.ensg-sdi.docker.conf /etc/nginx/conf.d/hub.ensg-sdi.docker.conf
COPY ensg-sdi.docker.conf /etc/nginx/conf.d/ensg-sdi.docker.conf
#COPY api.ensg-sdi.docker.conf /etc/nginx/conf.d/api.ensg-sdi.docker.conf