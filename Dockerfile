# syntax=docker/dockerfile:1

FROM python:3.11

RUN apt-get update
RUN apt-get install git curl gcc

ENV TZ=America/Sao_Paulo
ENV GOSU_VERSION=1.10
ENV GIST_URL="https://gist.githubusercontent.com/LucasVmigotto/7fc580f9a9ce63c01cebcad99ae8d444/raw/411eae79c02486900cce60b75920fd81b065b6a3/entrypoint.sh"

RUN curl -sS \
    -Lo /usr/bin/gosu \
    https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64

RUN curl $GIST_URL > /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/gosu

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
