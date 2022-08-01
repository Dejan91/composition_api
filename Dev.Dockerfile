FROM node:17-alpine

RUN npm install -g @vue/cli
RUN apk add git

ARG USER_ID
ARG GROUP_ID

RUN deluser --remove-home node \
  && addgroup -S dejan -g $GROUP_ID \
  && adduser -S -G dejan -u $USER_ID dejan

USER dejan

WORKDIR /app

EXPOSE 8080

ENTRYPOINT ["sh"]
