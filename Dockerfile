FROM quay.io/projectquay/golang:1.20 as builder

WORKDIR /app

COPY go.* ./

RUN go mod download

COPY *.go ./

RUN go build -o /nethello

EXPOSE 8080

ENTRYPOINT ["/nethello"]
