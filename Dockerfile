ARG ELIXIR_VERSION=1.8.1
FROM shoresuite/alpine-elixir:${ELIXIR_VERSION}

LABEL maintainer="Alistair A. Israel <alistair@shoresuite.com>"

# Add local node module binaries to PATH
ENV PATH=./node_modules/.bin:$PATH \
  MIX_HOME=/opt/mix \
  HEX_HOME=/opt/hex \
  HOME=/opt/app

WORKDIR ${HOME}

# Install NPM
RUN \
  mkdir -p ${HOME} && \
  chmod -R 777 ${HOME} && \
  apk --no-cache --update --available upgrade && \
  apk --no-cache --update add \
  git make g++ wget curl inotify-tools \
  nodejs nodejs-npm && \
  npm install npm -g --no-progress && \
  update-ca-certificates --fresh && \
  rm -rf /var/cache/apk/*

# Install Hex+Rebar
RUN mix local.hex --force && \
  mix local.rebar --force

CMD ["/bin/sh"]
