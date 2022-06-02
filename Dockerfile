# build stage 
FROM node:16.15.0 as build-stage

WORKDIR /image

COPY package.json ./
COPY package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /image/dist usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]