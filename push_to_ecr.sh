#!/bin/sh -ue

registry=$1
repo=$2
tag=$3
dockerfile=$4
extra_build_args="$5"
parsed_tag=$(echo $tag | sed 's|.*/||')

if aws ecr describe-images --repository-name $repo --image-ids imageTag=$parsed_tag --region $AWS_REGION > /dev/null 2>&1; then
  echo "The image $tag is already in the registry"
else
  docker build -f $dockerfile $extra_build_args -t "$registry/$repo:$parsed_tag" .
  docker push "$registry/$repo:$parsed_tag"
fi
