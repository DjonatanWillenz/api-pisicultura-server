FROM node:alpine

WORKDIR /user/ws

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY . .

EXPOSE 3002

CMD [ "npm", "start" ]