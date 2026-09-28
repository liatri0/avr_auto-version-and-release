# Stage 1: build
FROM gcc:14 AS builder
WORKDIR /src
COPY main.c .
RUN gcc -O2 -static -o app main.c

# Stage 2: minimal runtime
FROM scratch
COPY --from=builder /src/app /app
ENTRYPOINT ["/app"]
