FROM node:alpine as build

LABEL org.opencontainers.image.source https://github.com/Tedyst/filedrop-ws
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY . /app

RUN apk add --no-cache make gcc g++ python && \
  yarn install && \
  apk del make gcc g++ python
RUN yarn build

EXPOSE 5000
ENV WS_HOST 0.0.0.0
CMD ["yarn", "start"]
