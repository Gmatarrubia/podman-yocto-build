#!/usr/bin/bash

export reporoot="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
export PODMAN_IMAGE_NAME="yocto-env"

echo "Building podman image"
podman build \
    -t "${PODMAN_IMAGE_NAME}" \
    "${reporoot}"
