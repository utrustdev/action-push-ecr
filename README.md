# Github Action - Push to AWS ECR

Builds and pushes a docker image to AWS ECR. Checks if the tag exists already,
to skipping redundant builds

## Usage

```
jobs:
  deploy:
    steps:
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1-node16
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: aws-region-1

      - name: Build and push to ECR
        uses: utrustdev/action-push-ecr@v1.0.0
        with:
          repo: safe-keeper
          tag: ${{ github.ref }}
          dockerfile: Dockerfile
```
