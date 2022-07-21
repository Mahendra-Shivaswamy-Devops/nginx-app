#!/bin/bash

# get current branch and push
current_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

# git pull
git pull origin "$current_branch"
echo "====pull changes from '$current_branch' branch"

# get the argument message
version="$1"

# If no commit message is passed, use current date time in the commit message
if [[ -z "${version// }" ]]
    then
        message=$(date '+%Y-%m-%d %H:%M:%S')
fi

# stage all changes
git add .
echo "====staged all git files"

# add commit
git commit -m "Bump Version to $version"
echo "====added the commit with message: 'Bump Version to $version'"

# git push
git push origin "$current_branch"
echo "====pushed changes to '$current_branch' branch"

# docker build and push is automated using github actions

# login to docker hub
docker login -u $HUB_USERNAME -p $HUB_PASSWORD
echo "====login to docker hub account"


# docker build
docker build -t mahendrashivaswamy/cicd:$version .
echo "====built docker image and tagged with the specified version"

# docker push
docker push mahendrashivaswamy/cicd:$version
echo "====pushed the docker image"


# output version number
echo "====Version Output: '$version'"
