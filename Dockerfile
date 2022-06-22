FROM node:16.15.1-alpine as build

WORKDIR "/app"

COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build && npm prune --production

FROM node:16.15.1-alpine as final

WORKDIR "/app"

RUN npm install pm2@latest -g

USER node:node
COPY --from=build --chown=node:node /app/dist dist

WORKDIR /app/dist
EXPOSE 8080

CMD [ "pm2", "serve", "--spa", "--name", "webapp", "--port", "8080", "--no-daemon"]