FROM node:20.13.1-alpine as build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --only=production

COPY . ./

FROM node:20.13.1-alpine

WORKDIR /app

COPY --from=build /app .

CMD ["node", "server.js"]
EXPOSE 3001