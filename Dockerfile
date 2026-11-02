FROM golang:1.26-alpine AS builder
WORKDIR /app
COPY main.go .
RUN CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o /hello-world main.go
FROM scratch
COPY --from=builder /hello-world /hello-world
USER 65532:65532
ENTRYPOINT ["/hello-world"]
