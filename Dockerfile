# base image
FROM alpine:latest

# maintainer
MAINTAINER Karel Fiala <fiala.karel@gmail.com>

# install
RUN apk --no-cache add openssh-client

# just an example ... it does not make sense
ENV SSH_PORT 22
ENV SSH_DEST "root@127.0.0.1"
ENV SSH_FORWARD "-R 0.0.0.0:80:127.0.0.1:80"

# set startup command
ENTRYPOINT ssh -o ServerAliveInterval=30 -o ExitOnForwardFailure=yes -o StrictHostKeyChecking=no $SSH_FORWARD -p $SSH_PORT $SSH_DEST -nNT
