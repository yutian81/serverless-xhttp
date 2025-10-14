FROM golang:1.24-alpine AS builder

WORKDIR /tmp/app

RUN apk add --no-cache git ca-certificates tzdata wget && \
    wget https://raw.githubusercontent.com/eooce/serverless-xhttp/refs/heads/golang/go.mod -O go.mod && \
    wget https://raw.githubusercontent.com/eooce/serverless-xhttp/refs/heads/golang/go.sum -O go.sum && \
    go mod download && \
    wget https://raw.githubusercontent.com/eooce/serverless-xhttp/refs/heads/golang/main.go -O main.go

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app main.go

FROM alpine:latest

WORKDIR /tmp/app

RUN apk --no-cache add ca-certificates curl bash

COPY --from=builder /tmp/app/app .

RUN chmod +x app

EXPOSE 7860

ENV DOMAIN=xxxx.cpm \ # 修改为分配的域名,部署时删除注释,哪吒继续往下新增变量或设置secrets
    PORT=7860 \
    NAME=Hug \
    UUID=c0990c21-d567-4e27-b268-da113080ae72 \
    NEZHA_SERVER=XXXXXXX:8008 \
    NEZHA_KEY=XXXXXXXXXXX

CMD ["./app"]
