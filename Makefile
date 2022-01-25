

VERSION := $(shell git rev-parse --short HEAD)

build:
	docker build -t eldius/sshd:$(VERSION) .

start: build
	docker run -it --rm --name test -p 2222:22 eldius/sshd:$(VERSION)

push: build
	docker tag eldius/sshd:$(VERSION) eldius/sshd:latest
	docker push eldius/sshd:$(VERSION)
	docker push eldius/sshd:latest

