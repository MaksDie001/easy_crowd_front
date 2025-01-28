FROM node:20-alpine
WORKDIR /app

# Устанавливаем зависимости глобально
COPY package.json /app/
COPY package-lock.json /app/
COPY tsconfig.json /app
COPY next-env.d.ts /app
COPY index.d.ts /app
COPY src /app/src
COPY next.config.mjs /app
COPY .env.production /app

RUN npm install && npm run build

EXPOSE 3000
CMD ["npm", "start"]

