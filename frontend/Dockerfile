# 1. Builder
FROM node:24-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .

# Для решения проблемы совместимости
ENV NODE_OPTIONS="--openssl-legacy-provider"

RUN npm run build

# 2. Runner
FROM nginx:1.29.1-alpine
COPY --from=builder /usr/src/app/dist/frontend/* /usr/share/nginx/html/
EXPOSE 80