FROM debian:11

#install nginx
RUN apt update && apt install curl nginx -y \
		&& apt clean && rm -rf /var/lib/apt/lists/*

#define work directories
WORKDIR /

#copy our conf on the default conf ?
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/setup_nginx.sh /usr/local/bin/setup_nginx.sh
EXPOSE 443


RUN chmod 755 /usr/local/bin/setup_nginx.sh

ENTRYPOINT [ "/usr/local/bin/setup_nginx.sh" ]