#
# Build image: docker build -t gridiron-zone/fury .
#
FROM golang:1.18-alpine3.16 as builder

# Set up dependencies
ENV PACKAGES make gcc git libc-dev bash linux-headers eudev-dev

WORKDIR /fury

# Add source files
COPY . .

# Install minimum necessary dependencies
RUN apk add --no-cache $PACKAGES

RUN make build

# ----------------------------

FROM alpine:3.16

# p2p port
EXPOSE 26656
# rpc port
EXPOSE 26657
# metrics port
EXPOSE 26660

COPY --from=builder /fury/build/ /usr/local/bin/