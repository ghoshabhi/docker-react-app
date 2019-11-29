FROM node:alpine as builder

LABEL maintainer=abhighosh18@gmail.com
LABEL version="1.0.0"

WORKDIR /app

COPY package.json .
COPY package-lock.json .
RUN npm install

COPY . .

# puts build files in "/app/build" directory
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
