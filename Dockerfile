FROM rust:1.91
WORKDIR /app

COPY . .

RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/app/target \
    cargo build --release

ENTRYPOINT ["/app/target/release/hello-otel-on-actix-web"]