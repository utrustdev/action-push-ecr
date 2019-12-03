# Github Action - Push to AWS ECR

Builds and pushes a docker image to AWS ECR. Checks if the tag exists already,
to skipping redundant builds

## Usage

```
jobs:
  deploy:
    steps:
      - name: Build and push to ECR
        uses: utrustdev/action-push-ecr@v0.1.0
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: eu-central-1
          AWS_ACCOUNT_ID: ${{ secrets.AWS_ACCOUNT_ID }}
        with:
          repo: safe-keeper
          tag: ${{ github.ref }}
          dockerfile: Dockerfile
```
