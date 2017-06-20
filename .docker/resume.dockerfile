FROM ubuntu
MAINTAINER Christian Dobert <idontreallyneedthese@gmail.com>

RUN apt-get update
RUN apt-get install build-essential pandoc context -y

# prepare a user which runs everything locally! - required in child images!
RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app
WORKDIR $HOME

ENV APP_NAME=resume

# before switching to user we need to set permission properly
# copy all files, except the ignored files from .dockerignore
COPY . $HOME/$APP_NAME/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/$APP_NAME

RUN make clean
