FROM node:20.13.1-alpine as build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --omit=dev 

COPY server.js ./server.js

FROM node:20.13.1-alpine

RUN apk add --no-cache curl

WORKDIR /app

COPY --from=build /app .

CMD ["npm", "run", "start"]
EXPOSE 3001