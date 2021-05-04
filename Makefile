PROJDIR=/$$HOME/tmp

# build the docker image
build:
	docker build -t goide .
.PHONY: build

# run goide
run:
	docker container run --rm --interactive  \
	  --tty \
	  --name goide \
	  --mount type=bind,source="$(PROJDIR)",target="/projects" \
	  goide
.PHONY: run
