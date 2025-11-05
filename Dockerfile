FROM node:lts-bookworm AS build

WORKDIR /website
COPY . .

RUN npm install
RUN npm run build

FROM joseluisq/static-web-server:2-alpine
COPY --from=build /website/dist /public

EXPOSE 80