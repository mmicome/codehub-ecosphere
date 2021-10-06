FROM node:latest

ENV PROJECT_ENV production
# ENV NODE_ENV production

WORKDIR /code

ADD package.json package-lock.json nuxt.config.js /code/

RUN npm config set registry https://registry.npm.taobao.org
RUN npm install -g pm2@latest
RUN npm ci
ADD static /code/static/
ADD .next /code/.next/

# 暴露端口映射
EXPOSE 8085
EXPOSE 443

CMD [ "pm2-runtime", "start", "npm", "--", "start" ]