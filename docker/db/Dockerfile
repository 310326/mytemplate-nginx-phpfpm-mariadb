FROM mariadb:10.5.4
MAINTAINER satomitsuru

#COPY ./conf.d/my.cnf /etc/mysql/conf.d/zzz-my.cnf  # mariadb usualy default. if you need other settings.
COPY ./docker-entrypoint-initdb.d /docker-entrypoint-initdb.d

# treat Windows
RUN chmod 644 /etc/mysql/conf.d/*
