#!/bin/sh

set -xe

REGISTRY=${REGISTRY:-499769600463.dkr.ecr.eu-west-1.amazonaws.com}
NAME=filefetcher
TAG=$(git rev-parse HEAD)-$BUILD_NUMBER

echo "Pushing docker $REGISTRY/$NAME:$TAG"
# $(aws ecr get-login --region eu-west-1)

# echo "Writing Docker creds to $1"
# chmod 544 ~/.docker/config.json
# cp ~/.docker/config.json $1

docker push $REGISTRY/$NAME:$TAG
docker push $REGISTRY/$NAME:latest

# Remove local image
docker rmi $REGISTRY/$NAME:$TAG
