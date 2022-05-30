FROM node:16.15.0

WORKDIR /image

COPY package.json ./
COPY package-lock.json ./

RUN npm install

COPY . .

RUN npm run build