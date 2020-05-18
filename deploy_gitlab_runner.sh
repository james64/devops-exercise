#!/bin/bash

# todo add checks (root user, args)

regToken="$1"
runnerHostDir="/var/opt/gitlab-runner"

docker run -d \
    --name gitlab-runner \
    --restart always \
    -v $runnerHostDir:/etc/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab/gitlab-runner:latest


docker run --rm \
  -v $runnerHostDir:/etc/gitlab-runner \
  gitlab/gitlab-runner \
  register \
  --non-interactive \
  --executor docker \
  --docker-image alpine:latest \
  --url "https://gitlab.dubovsky.devops.klikuj.cz/" \
  --registration-token="$regToken" \
  --description "runner numero uno" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"

