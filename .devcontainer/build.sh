DOCKER_BUILDKIT=1 docker build --network=host \
    --build-arg WORKSPACE=image_pipeline \
    -t iss/image_pipeline:humble .
