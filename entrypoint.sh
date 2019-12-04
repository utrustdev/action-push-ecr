#!/bin/sh -ue

repo=$1
tag=$2
dockerfile=$3
parsed_tag=$(echo $tag | sed 's|.*/||')
account_url=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

eval $(aws ecr get-login --region $AWS_REGION --no-include-email)

if aws ecr describe-images --repository-name $repo --image-ids imageTag=$tag --region $AWS_REGION > /dev/null 2>&1; then
  echo "The image $tag is already in the registry"
else
  docker build -f $dockerfile -t "$account_url/$repo:$parsed_tag" .
  docker push "$account_url/$repo:$parsed_tag"
fi
