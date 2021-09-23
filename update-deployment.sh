#!/bin/sh
SHORT_COMMIT_HASH=$(git rev-parse --short HEAD)
TAG="sha-${SHORT_COMMIT_HASH}"


rm -rf output
mkdir -p output/workloads

echo "Updating deployment with image tag ${TAG}"

sed "s/go-hello-http:latest/go-hello-http:${TAG}/g" kubernetes/app.yaml

sed "s/go-hello-http:latest/go-hello-http:${TAG}/g" kubernetes/app.yaml > output/workloads/app.yaml
