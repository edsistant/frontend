FROM node:lts as build-stage
WORKDIR /nuxtapp
COPY . .
RUN corepack enable
RUN pnpm install
RUN pnpm run build
RUN rm -rf node_modules && \
  NODE_ENV=production pnpm install \
  --prefer-offline \
  --production=true
FROM node:lts as prod-stage
WORKDIR /nuxtapp
EXPOSE 3000
COPY --from=build-stage /nuxtapp/.output/  ./.output/
CMD [ "node", ".output/server/index.mjs" ]
