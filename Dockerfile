FROM node:16-alpine as builder

#First phase: Build
WORKDIR '/app'
COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# Second phase: Run nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html