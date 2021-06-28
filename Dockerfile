FROM node:10 AS builder

WORKDIR /app

COPY . .

RUN npm run build

FROM nginx:alpine

WORKDIR  /usr/share/nginx/html

COPY --from=builder /build .

CMD ["nginx", "-g", "daemon off;"]

