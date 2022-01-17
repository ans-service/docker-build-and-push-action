# Docker build and push action

## Description

This action allows you to build and push a Dockerfile onto a Container Registry (Azure Container Registry for example).

## Usage

### ADD Step On workflow
Only you need to add the nexts lines on your github workflow replacing yours custom variables:

``` yaml
      - name: Docker Build and Push
        id: build_and_push
        uses: ans-service/docker-build-and-push@v1.0
        with:
          username:   ${{ secrets.DOCKER_USERNAME }}
          password:   ${{ secrets.DOCKER_PASSWORD }}
          registry:   "docker.io"
          repository: "my_repository"
          image_name: "my_image"
          image_tag:  "v0.0.1"
```

### GET output

```yaml
      - name: Get generated image path
        run: |
          echo "Docker Image generate [${{ steps.build_and_push.outputs.image_path }}]"
```