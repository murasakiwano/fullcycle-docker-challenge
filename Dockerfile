FROM golang:1.21 as builder

WORKDIR /usr/src/app

COPY . .
RUN go build -v -o /usr/local/bin/app ./...

FROM scratch

COPY --from=builder /usr/local/bin/app /usr/local/bin/app

CMD ["app"]
