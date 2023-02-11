FROM debian:buster AS build
RUN apt-get update && apt-get install -y wget snapd
WORKDIR /tmp
ARG TARGETARCH
RUN wget "https://github.com/gohugoio/hugo/releases/download/v0.110.0/hugo_0.110.0_linux-${TARGETARCH}.deb"
RUN dpkg -i "hugo_0.110.0_linux-${TARGETARCH}.deb"
COPY . /dist
WORKDIR /dist
RUN hugo

FROM nginx:1.23
COPY --from=build /dist/public /usr/share/nginx/html
