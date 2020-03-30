FROM clux/muslrust AS build

RUN mkdir /source
WORKDIR /source
COPY ./Cargo.toml .
COPY ./Cargo.lock .
COPY ./src ./src

RUN cargo build --release
RUN strip ./target/x86_64-unknown-linux-musl/release/tokio-socks5


FROM scratch
EXPOSE 1080
COPY --from=build /source/target/x86_64-unknown-linux-musl/release/tokio-socks5 /

ENTRYPOINT [ "./tokio-socks5"]