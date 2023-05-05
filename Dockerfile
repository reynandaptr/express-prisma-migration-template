FROM node:18.12.0-alpine

COPY . .

RUN pnpm install

EXPOSE 80

CMD ["/bin/sh","-c","source /etc/profile && /wait && npx prisma migrate dev --schema prisma/schema.prisma --name init && nginx -g 'daemon off;'"]
