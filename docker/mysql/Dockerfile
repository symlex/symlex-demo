FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD symlex
ENV MYSQL_USER web
ENV MYSQL_PASSWORD web
ENV MYSQL_DATABASE web

COPY ./docker/mysql/snapshot.sql /docker-entrypoint-initdb.d/snapshot.sql