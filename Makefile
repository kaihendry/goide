YOURSRC=/$$HOME/tmp

.PHONY:
build:
	docker build -t goide .

.PHONY:
run:
	docker container run --rm --interactive  \
	  --tty \
	  --name workbench \
	  --mount type=bind,source="$(YOURSRC)",target="/projects" \
	  goide
