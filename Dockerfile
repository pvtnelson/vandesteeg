# Stage 1 - Build with Hugo
FROM hugomods/hugo:latest AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

# Stage 2 - Serve with nginx (non-root, port 8080)
FROM nginxinc/nginx-unprivileged:alpine
COPY --from=builder /src/public /usr/share/nginx/html
EXPOSE 8080
