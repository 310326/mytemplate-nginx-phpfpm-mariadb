FROM nginx:1.11-alpine
MAINTAINER satomitsuru

# agent user
ARG AGENT_UID=1000
RUN adduser -D -H -s /bin/sh -u ${AGENT_UID} appagent

# put conf
# !!! filename "app.conf.template" using in docker-compose.yml
#COPY ./nginx/conf.d/app.conf.template /etc/nginx/conf.d/app.conf.template
#COPY ./nginx/conf.d/wordpress.conf /etc/nginx/conf.d/app.conf.template
COPY ./nginx/conf.d/mynginx.conf /etc/nginx/conf.d/app.conf.template
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
