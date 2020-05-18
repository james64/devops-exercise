#!/bin/bash

regToken="$1"

docker run --rm \
  -v /var/opt/gitlab-runner:/etc/gitlab-runner \
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

