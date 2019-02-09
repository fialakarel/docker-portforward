IMAGE_NAME="fialakarel/portforward"

build:
	docker build -t $(IMAGE_NAME) .

build-nc:
	docker build --no-cache --pull -t $(IMAGE_NAME) .

push:
	docker push $(IMAGE_NAME)

testrun:
	#RUN: docker run --rm -it --net host --name portforward80-test --volume /root/.ssh:/root/.ssh:ro --env SSH_FORWARD="-R <src-ip>:<src-port>:<dst-ip>:<dst-port>" --env SSH_PORT=2222 --env SSH_DEST="root@<dst-ip>" $(IMAGE_NAME)
