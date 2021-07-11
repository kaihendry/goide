PROJDIR=$(shell pwd)

# run goide in present working directory
run:
	docker container run --rm --interactive  \
	  --tty \
	  --name goide \
	  --mount type=bind,source="$(PROJDIR)",target="/proj" \
	  hendry/goide
.PHONY: run

# build the docker image
build:
	docker build -t hendry/goide .
.PHONY: build
