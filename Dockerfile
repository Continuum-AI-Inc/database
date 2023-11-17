FROM postgres:latest
ENV POSTGRES_USER main
ENV POSTGRES_PASSWORD ctACGEEnNe5NHL76qXKYiAwyBht4hRKz743EDFcpzDXXtLU4QBRPZAvVdhDQgrQf
ENV POSTGRES_DB main

COPY scripts /docker-entrypoint-initdb.d/