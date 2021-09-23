#!/bin/sh

TAG=$1

rm -rf output
mkdir output

sed "s/go-hello-http:latest/go-hello-http:${TAG}/g" kubernetes/app.yaml
#sed "s/go-hello-http:latest/go-hello-http:${TAG}/g" kubernetes/app.yaml > output/app.yaml
