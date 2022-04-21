FROM ruby:alpine3.15

LABEL maintainer="Chandra Mohan Reddy"

ARG APP_USER=app
ARG APP_GROUP=appgroup
ARG APP_PATH=/app
ARG APP_USER_UID=7084
ARG APP_GROUP_GID=2001

# adding new user named app and group

RUN apk add --no-cache && \
      addgroup -g $APP_GROUP_GID -S $APP_GROUP && \
      adduser -S -s /sbin/nologin -u $APP_USER_UID -G $APP_GROUP $APP_USER && \
      mkdir $APP_PATH && \
      chown $APP_USER:$APP_GROUP $APP_PATH


WORKDIR $APP_PATH

#copying the web.rb file to workdir

COPY --chown=$USER:$GROUP web.rb $APP_PATH/

ENTRYPOINT [ "ruby", "web.rb" ]

EXPOSE 80