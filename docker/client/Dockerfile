FROM node:20.11.1-alpine3.19

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

EXPOSE 8000

CMD ["yarn", "dev", "-p", "8000"]
