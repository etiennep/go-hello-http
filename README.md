# go-hello-http

A simple HTTP server written in Go.

This repository is used to demonstrate a rudimentary CI/CD pipeline for applications deployed to Kubernetes clusters using a [GitOps](https://www.gitops.tech/) process. 

## CI/CD Pipeline

The CI/CD pipeline is used to completely automate the process of building, publishin and deploying an application from a single commit or PR merge. It is implemented entirely using free services and components.

The following diagram illustrates the various phases of the pipeline.

![CI/CD Pipeline](CI_CD_pipeline.png)

### Phase: Continuous Integration

The Continous Integration phase is implemented using a [GitHub Actions](https://github.com/features/actions) workflow. 

This phase could also be built using other continuous integration tools/services such as [Buildkite](https://buildkite.com/).

#### Step: Build image

Builds the application and its Docker image.

#### Step: Tag image

Tags the Docker image with the current git commit sha.

#### Step: Push image to registry

Pushes the new Docker image to a [Dockerhub image repository](https://hub.docker.com/repository/docker/etiennep/go-hello-http).

The docker image could also be pushed to any docker registry such as ECR.

#### Step: Render Deployment Specs

Once the docker image has been published, the workflow updates the image tag in the Kubernetes [deployment specs](kubernetes/app.yaml).

