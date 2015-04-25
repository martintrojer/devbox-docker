.PHONY:	connect-local

connect-local:
	docker run --rm -v $(shell pwd):/home/martin/src/github.com/martintrojer/goproject -i -t devbox-local /bin/bash

run-remote:
	docker run -d -p 2222:22 -t devbox-remote

build-all: build-remote build-local

build-remote:
	docker build --rm -f Dockerfile.allin -t devbox-remote .

build-local:
	docker build --rm -f Dockerfile.hybrid -t devbox-local .
