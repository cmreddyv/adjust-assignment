FROM ruby:alpine3.15

LABEL maintainer="Chandra Mohan Reddy"

ARG APP_PATH=/app

RUN apk add --no-cache && \
      mkdir $APP_PATH


WORKDIR $APP_PATH

COPY web.rb $APP_PATH/

ENTRYPOINT [ "ruby", "web.rb" ]

EXPOSE 80