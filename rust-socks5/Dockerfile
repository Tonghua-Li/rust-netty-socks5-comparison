FROM clux/muslrust AS build

RUN mkdir /source
WORKDIR /source
COPY ./Cargo.toml .
COPY ./Cargo.lock .
COPY ./src ./src

RUN cargo build --release
RUN strip ./target/x86_64-unknown-linux-musl/release/merino


FROM scratch
EXPOSE 1080
COPY --from=build /source/target/x86_64-unknown-linux-musl/release/merino /

# cannot use CMD ["./merino --no-auth"], it won't find the cmd
ENTRYPOINT [ "./merino", "--no-auth"]