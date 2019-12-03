#!/bin/sh -ue

repo=$1
tag=$2
dockerfile=$3
account_url=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

eval $(aws ecr get-login --region $AWS_REGION --no-include-email)

if aws ecr describe-images --repository-name $repo --image-ids imageTag=$tag --region $AWS_REGION > /dev/null 2>&1; then
  echo "The image $tag is already in the registry"
else
  docker build -f $dockerfile -t "$account_url/$repo:$tag" .
  docker push "$account_url/$repo:$tag"
fi
