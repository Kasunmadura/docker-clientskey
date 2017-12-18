## This is for app server with nodejs with forever

FROM node:5
MAINTAINER kasunmaduraeng@gmail.com

ENV NODE_ENV production

RUN npm install -g forever pushstate-server

VOLUME ["/app"]
WORKDIR /app

EXPOSE 8080

ENTRYPOINT npm install; forever start.js
