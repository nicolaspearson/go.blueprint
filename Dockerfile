# BUILDER - Build binary for production
FROM golang:1.16 as builder
WORKDIR /go/src/github.com/nicolaspearson/go.blueprint/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o blueprint main.go
RUN echo > .env.docker

RUN GRPC_HEALTH_PROBE_VERSION=v0.3.6 && \
    wget -qO/bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
    chmod +x /bin/grpc_health_probe

# RUNNER - Production image
FROM gcr.io/distroless/static-debian10@sha256:4433370ec2b3b97b338674b4de5ffaef8ce5a38d1c9c0cb82403304b8718cde9 as distroless

ARG RELEASE_VERSION=unknown
ENV RELEASE_VERSION=$RELEASE_VERSION

ARG VERSION=unknown
ENV VERSION=$VERSION

WORKDIR /bin/
COPY --from=builder /go/src/github.com/nicolaspearson/go.blueprint/blueprint .
COPY --from=builder /go/src/github.com/nicolaspearson/go.blueprint/.env.docker .env
COPY --from=builder /bin/grpc_health_probe .
ENTRYPOINT [ "/bin/blueprint" ]
