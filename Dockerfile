FROM node:18.12.0-alpine

WORKDIR /usr/src/app

COPY . .

RUN npm install -g pnpm
RUN pnpm install

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

RUN apk update
RUN apk add nginx

EXPOSE 80

CMD ["/bin/sh","-c","source /etc/profile && /wait && npx prisma migrate dev --schema prisma/schema.prisma --name init && nginx -g 'daemon off;'"]
