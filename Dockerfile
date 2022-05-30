FROM node.16.15.0

WORKDIR /image

COPY package.json /image/package.json
COPY package-lock.json /image/package.json

RUN npm install

COPY . /image/

RUN npm run serve