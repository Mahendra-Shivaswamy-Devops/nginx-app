Documentation
-------------

Local Machine Setup
-------------------

Install terraform, docker, kubectl, git

Docker hub account credentials are exported as environment variables

Github ssh auth is setup 

Github credentials are created to store dockerhub credentials

kubecofig is saved in ~/.kube/devops file


Contents of the repo
-------------------

1. build.sh

```bash
build.sh <version>
```

Commits the changes the repo

Builds docker image and pushes the docker image to the docker hub


2. Dockerfile - Dockerfile to build nginx image

3. static - static files used by nginx container

4. nginx.conf - nginx conf for hosting static files
