FROM golang:alpine as builder
RUN cd src && mkdir hello-world 
WORKDIR /src/hello-world
RUN go mod init example/hello
COPY . .
RUN go build -o /go/bin/hello-world

FROM scratch
COPY --from=builder /go/bin/hello-world /go/bin/hello-world
ENTRYPOINT [ "/go/bin/hello-world" ]
