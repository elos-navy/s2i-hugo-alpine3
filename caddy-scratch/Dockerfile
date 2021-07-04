FROM scratch

COPY ./* /

ADD https://github.com/caddyserver/caddy/releases/download/v2.4.3/caddy_2.4.3_linux_amd64.tar.gz /

SHELL ["/bash", "-c"]

RUN /tar -z --use-compress-program="/gzip -d" -xf /caddy_2.4.3_linux_amd64.tar.gz /

CMD /caddy