FROM node:16.18.0-alpine3.15

WORKDIR /app

COPY . .

RUN npm install --omit=dev

CMD ["npm", "start"]