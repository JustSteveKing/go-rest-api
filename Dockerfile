FROM golang:alpine as base

WORKDIR /app
COPY . /app

RUN CGO_ENABLED=0 go build -a -ldflags '-s' -o server

FROM scratch
CMD ["/server"]
COPY --from=base /app/server /server
