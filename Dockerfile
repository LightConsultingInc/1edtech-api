# DEV BUILD
FROM node:18-alpine As dev
ENV NODE_ENV dev

WORKDIR /app
COPY package*.json ./
COPY yarn.lock ./

RUN yarn install

COPY . .

RUN yarn run build

CMD npx knex migrate:latest && node dist/src/main.js


# PROD BUILD
FROM node:18-alpine As production
ENV NODE_ENV production

WORKDIR /app
COPY package*.json ./
COPY yarn.lock ./

RUN yarn install

COPY . .

RUN yarn run build

CMD npx knex migrate:latest && node dist/src/main.js
