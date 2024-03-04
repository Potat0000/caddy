FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/alidns \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/powerdns \
    --with github.com/caddyserver/replace-response \
    --with github.com/WeidiDeng/caddy-cloudflare-ip

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
