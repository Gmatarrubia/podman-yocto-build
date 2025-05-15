PODMAN = podman
IMAGE = yocto-env

.PHONY: build run

build:
	$(PODMAN) build -t $(IMAGE) .

run:
	$(PODMAN) run $(IMAGE)