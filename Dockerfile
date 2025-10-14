FROM ghcr.io/eooce/sbx:latest

WORKDIR /tmp/app

ENV DOMAIN=https:/xxxxxxxxxx.hf.space \
    PORT=7860 \
    NAME=Hug \
    UUID=d38df0a5-4476-48f9-84dc-3410a49aba82 \
    NEZHA_SERVER=xxxx.xxxx.net:8008 \
    NEZHA_KEY=xxxxxxxxxxxxxxxxxxx

EXPOSE 7860
