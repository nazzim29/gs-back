FROM node:latest

WORKDIR /var/gs-back

COPY ./package.json ./

RUN npm install

COPY . .

CMD [ "npm","t" ]


