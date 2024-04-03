FROM golang:alpine as builder

WORKDIR /go/src/app

COPY . .

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /app main.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]