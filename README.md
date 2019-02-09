# portforward

Lightweight Docker image for port forwarding using SSH.

## Usage

### Testing

    # Just for testing
    docker run \
        --rm -it \
        --net host \
        --name portforward80 \
        --volume /root/.ssh:/root/.ssh:ro \
        --env SSH_FORWARD="-R <src-ip>:<src-port>:<dst-ip>:<dst-port>" \
        --env SSH_PORT=2222 \
        --env SSH_DEST="root@<dst-ip>" \
        "fialakarel/portforward

### Production

    # Create directory structure first
    mkdir -p /root/portforward/root/.ssh
    
    # Run production version
    docker run \
        --detach \
        --restart always \
        --net host \
        --name portforward80 \
        --volume /root/portforward/.ssh:/root/.ssh:ro \
        --env SSH_FORWARD="-R <src-ip>:<src-port>:<dst-ip>:<dst-port>" \
        --env SSH_PORT=2222 \
        --env SSH_DEST="root@<dst-ip>" \
        "fialakarel/portforward
