PROJDIR=$(shell pwd)
IMAGE=hendry/goide

# run goide in present working directory
run:
	docker container run --rm --interactive  \
	  --tty \
	  --name goide \
	  --mount type=bind,source="$(PROJDIR)",target="/src" \
	  $(IMAGE)
.PHONY: run

# update the docker image
update:
	docker pull $(IMAGE)
.PHONY: build

# build the docker image
build:
	docker build -t $(IMAGE) .
.PHONY: build
