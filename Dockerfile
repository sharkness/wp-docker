FROM node:14.15.5-stretch


RUN DEBIAN_FRONTEND="noninteractive" apt-get update \
    && apt-get install -y yarn bash \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH=node_modules/.bin:$PATH
WORKDIR /var/www/html
