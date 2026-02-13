FROM golang:1.23-alpine AS build
WORKDIR /src
COPY services/bff/go.mod ./
RUN go mod download || true
COPY services/bff .
RUN go build -o /bin/bff ./cmd/bff

FROM alpine:3.20
COPY --from=build /bin/bff /bin/bff
EXPOSE 3001
CMD ["/bin/bff"]
