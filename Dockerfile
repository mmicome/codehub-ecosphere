FROM node:14-alpine as builder

ENV PROJECT_ENV production
# ENV NODE_ENV production

WORKDIR /code

ADD package.json package-lock.json /code/
RUN npm ci

ADD . /code
RUN npm run build