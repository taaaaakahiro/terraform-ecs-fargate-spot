# Build Go Server Binary
FROM golang:1.19-buster AS build

WORKDIR /project

# Only copy go.mod and go.sum, and download go mods separately to support layer caching
COPY ./main.go ./go.mod ./
RUN go mod download
RUN go build  -o ./bin/server .

FROM debian:bullseye
RUN apt update && apt install -y curl
COPY --from=build /project/bin/server /bin/server

CMD ["/bin/server"]