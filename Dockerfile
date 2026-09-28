# Stage 1 - Build with Hugo
FROM hugomods/hugo:latest AS builder
WORKDIR /src
COPY . .
ARG HUGO_BASEURL=https://vandesteeg.dev
RUN hugo --minify --baseURL "$HUGO_BASEURL"

# Stage 2 - Serve with nginx (non-root, port 8080)
FROM nginxinc/nginx-unprivileged:alpine
COPY nginx/redirects.conf /etc/nginx/conf.d/redirects.conf
COPY --from=builder /src/public /usr/share/nginx/html
EXPOSE 8080
