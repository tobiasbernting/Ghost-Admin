FROM node:latest

RUN apt-get update && apt-get install -y gnupg gnupg2 apt-transport-https \
yarn

RUN yarn global add knex-migrator grunt-cli grunt-shell ember-cli bower

RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY package*.json ./

RUN npm install

RUN yarn setup

EXPOSE 2368