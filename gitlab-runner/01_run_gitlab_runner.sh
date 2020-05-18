#!/bin/bash

docker run -d \
    --name gitlab-runner \
    --restart always \
    -v /var/opt/gitlab-runner:/etc/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab/gitlab-runner:latest

