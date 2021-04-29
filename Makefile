YOURSRC=/$$HOME/tmp

# build the docker image
build:
	docker build -t goide .
.PHONY: build

# run goide
run:
	docker container run --rm --interactive  \
	  --tty \
	  --name workbench \
	  --mount type=bind,source="$(YOURSRC)",target="/projects" \
	  goide
.PHONY: run
