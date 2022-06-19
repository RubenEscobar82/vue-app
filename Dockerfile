# build stage 
FROM node:16.15.0 as build-stage

WORKDIR /app
RUN npm install pm2@latest -g

COPY . .
RUN npm install
RUN npm run build

EXPOSE 8080

WORKDIR /app/dist
CMD [ "pm2", "serve", "--spa", "--name", "webapp", "--port", "8080", "--no-daemon"]