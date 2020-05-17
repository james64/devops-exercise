#!/bin/bash

regToken="$1"

docker run --rm \
  -v /mnt/nfs-data/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner \
  register \
  --non-interactive \
  --executor docker \
  --docker-image alpine:latest \
  --url "https://gitlab.dubovsky.devops.klikuj.cz/" \
  --registration-token="$regToken" \
  --description "runner number one" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"

