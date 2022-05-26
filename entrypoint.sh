#!/bin/sh -l

IMAGE="$INPUT_REGISTRY/$INPUT_REPOSITORY/$INPUT_IMAGE_NAME:$INPUT_IMAGE_TAG"
IMAGE_LATEST="$INPUT_REGISTRY/$INPUT_REPOSITORY/$INPUT_IMAGE_NAME:latest"
az login --service-principal -u $INPUT_USERNAME -p $INPUT_PASSWORD --tenant $INPUT_TENANT
az acr login --name $INPUT_REGISTRY
az acr build -t $IMAGE -t $IMAGE_LATEST  -r ansregistry .
echo "::set-output name=image_path::$IMAGE"
