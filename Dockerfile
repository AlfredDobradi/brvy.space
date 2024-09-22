FROM debian:buster AS build
RUN apt-get update && apt-get install -y wget
WORKDIR /tmp
ARG TARGETARCH
RUN wget "https://github.com/gohugoio/hugo/releases/download/v0.110.0/hugo_0.110.0_linux-${TARGETARCH}.deb"
RUN dpkg -i "hugo_0.110.0_linux-${TARGETARCH}.deb"
COPY . /dist
WORKDIR /dist
RUN hugo

FROM nginx:1.23
LABEL org.opencontainers.image.source="https://github.com/AlfredDobradi/brvy.space" 
LABEL org.opencontainers.image.description="Nginx image serving the content from https://github.com/alfreddobradi/blog.brvy.space"
COPY --from=build /dist/public /usr/share/nginx/html
