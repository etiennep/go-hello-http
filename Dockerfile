FROM golang:1.17 AS builder

WORKDIR /go/src/app
COPY go.mod .
COPY *.go .

RUN CGO_ENABLED=0 GOOS=linux go build -v ./...

FROM scratch

WORKDIR /app/
CMD ["./go-hello-http"]

COPY --from=builder /go/src/app/go-hello-http ./
