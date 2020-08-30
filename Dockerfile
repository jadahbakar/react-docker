FROM node:14.9-alpine3.12 AS builder
# builder section
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
# /app/build <--all the stuff
RUN npm run build

FROM nginx:1.19.2-alpine
COPY --from=builder /app/build /usr/share/nginx/html