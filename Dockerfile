FROM caddy:builder AS builder

COPY caddy-powerdns /pdns

RUN xcaddy build \
    --with github.com/caddy-dns/powerdns=/pdns \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/replace-response

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
