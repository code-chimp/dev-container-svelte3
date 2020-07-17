## Build image
FROM node:14 as application

WORKDIR /var/app

COPY package.json package-lock.json* ./
RUN npm ci && npm cache clean --force

COPY ./ .
RUN npm run build

## Final image
FROM nginx:alpine

# set timezone to GMT time zone
# replace shell with bash
# install base dependencies
ENV TZ=GMT
RUN echo $TZ > /etc/timezone \
  && echo $TZ > /etc/localtime \
  && apk update \
  && apk upgrade

## Custom NGINX settings
COPY --from=application /var/app/docker-configs/nginx.conf /etc/nginx/nginx.conf
COPY --from=application /var/app/docker-configs/default.conf /etc/nginx/conf.d/default.conf

## Application folder
WORKDIR /usr/share/nginx/html

COPY --from=application /var/app/public .
