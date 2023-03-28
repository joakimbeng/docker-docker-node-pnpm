FROM docker:23.0.1-alpine3.17 as docker
FROM node:18.15-alpine3.17

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

RUN apk add --no-cache \
  bash \
  curl \
  python3 \
  python3-dev \
  make \
  gcc \
  libc6-compat \
  libffi-dev \
  g++ \
  git \
  openssh \
  openssl-dev \
  && ln -sf python3 /usr/bin/python \
  && python3 -m ensurepip \
  && pip3 install --no-cache --upgrade pip setuptools \
  && pip3 install --no-cache docker-compose \
  && npm install -g pnpm

CMD ["node"]
