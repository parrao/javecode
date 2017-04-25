#!/bin/sh
set -xe

REGISTRY=${REGISTRY:-499769600463.dkr.ecr.eu-west-1.amazonaws.com}
NAME=filefetcher
TAG=$(git rev-parse HEAD)

docker build -t $REGISTRY/$NAME:$TAG-$BUILD_NUMBER .
docker tag $REGISTRY/$NAME:$TAG-$BUILD_NUMBER $REGISTRY/$NAME:latest
